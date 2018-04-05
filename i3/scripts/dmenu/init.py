#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sqlite3
import json
import argparse
import sys
import os
from modules import Application, MPC
from Dmenu import Dmenu

del sys.path[0]
sys.path.insert(0, os.path.dirname(sys.argv[0]))


# CONFIG
loadModules = [Application(), MPC()]

con = sqlite3.connect(os.path.dirname(sys.argv[0]) + "/database.sqlite")

# ARGUMENTS PARSER

parser = argparse.ArgumentParser(description='Smart Dropdown Launcher for AwesomeWM')
parser.add_argument('--create', dest='FLAG_CREATE', action='store_const', const=True, default=False, help='Force TABLE \
                    CREATION')
parser.add_argument('--build', dest='FLAG_BUILD', action='store_const', const=True, default=False, help='Force Build \
the Database')
parser.add_argument('--truncate', dest='FLAG_TRUNCATE', action='store_const', const=True, default=False, help='Truncate\
 Database during build')
args = parser.parse_args()


# Helper functions

def create_db():
    command = "CREATE TABLE entries(`ID` INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, `Name` TEXT, `json` TEXT, `hits` INTEGER NOT NULL DEFAULT 0, `disabled` INTEGER NOT NULL DEFAULT 0, `type` TEXT NOT NULL DEFAULT 'file', `file` TEXT);"
    with con:
        cur = con.cursor()
        cur.execute(command)
        con.commit()


def retrieve_db():
    rows = []
    with con:
        con.row_factory = sqlite3.Row
        cur = con.cursor()
        cur.execute("SELECT * FROM entries;")
        ro = cur.fetchall()
        for r in ro:
            r = dict(r)
            r['json'] = json.loads(r['json'])
            rows.append(r)
    return rows


def build_db():
    entries = {}
    for mod in loadModules:
        entries.update(mod.build_db())
    for k, v in entries.items():
        with con:
            con.cursor().execute("INSERT INTO entries(Name, json, file, type, disabled) VALUES(?, ?, ?, ?, ?)",
                                 (k, json.dumps(v['json']), v['file'], v['type'], v['disabled']))


def build_menu():
    entries = []
    db = retrieve_db()
    for mod in loadModules:
        entries += mod.build_menu([x for x in db if x['type'] == mod.db_type])

    # sort by hits
    return sorted(entries, key=lambda i: i[2], reverse=True)


def run_program(data):
    with con:
        cur = con.cursor()
        cur.execute("UPDATE entries SET hits=? WHERE ID=?", (data[2] + 1, data[0]))
        cur.execute("SELECT type FROM entries WHERE ID=?", (data[0],))
        con.commit()
        typ = dict(cur.fetchone())['type']
        for mod in loadModules:
            if mod.db_type == typ:
                mod.call(data[1])


if (args.FLAG_CREATE):
    with con:
        con.cursor().execute("DROP TABLE IF EXISTS entries;")
    create_db()
    # set BUILD flag so the database gets rebuilt too
    args.FLAG_BUILD = True

if (args.FLAG_BUILD):
    if(args.FLAG_TRUNCATE):
        with con:
            con.cursor().execute("DELETE FROM entries")
            con.cursor().execute("DELETE FROM sqlite_sequence WHERE name='entries'")
            con.commit()
    build_db()

entries = build_menu()
p1 = Dmenu([x[1] for x in entries]).run()

if (p1[0] != 0):
    # error on escape
    exit(1)

selected = list(filter(lambda x: p1[1].strip().startswith(x[1]), entries))
if selected == []:
    # -> terminal module? None-Type modules?
    pass
else:
    # use actual user input
    selected = (selected[0][0], p1[1].rstrip(), selected[0][2])
    run_program(selected)

con.close()
