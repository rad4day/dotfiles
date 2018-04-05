from .Module import Module as _Module
import locale as _locale
import subprocess as _subprocess
import shlex as _shlex
from pathlib import Path as _Path
from os import listdir as _listdir
from os.path import isfile as _isfile, join as _join


class Application(_Module):

    def __init__(self):
        self.db_type = "Application"
        self._home = str(_Path.home())
        self._lang = _locale.getlocale()[0].split("_")[0].strip()
        self._dirs = ["/usr/share/applications", self._home + "/.local/share/applications"]
        self._references = {}

    def build_db(self):
        """Function which adds entries to the database.
           returns dict with:
           Name, json, disabled, type, "file" """
        db = {}
        for d in self._dirs:
            for fi in _listdir(d):
                if _isfile(_join(d, fi)):
                    fc = self._scan_file(_join(d, fi))
                    for k, v in fc.items():
                        db.update({k: {
                            "Name": k,
                            "json": v,
                            "disabled": (("NoDisplay" in v and v["NoDisplay"] == "true") or
                                         ("Hidden" in v and v["Hidden"] == "true")),
                            "file": v['file'],
                            "type": self.db_type
                        }})
            return db

    def update_db(self, database: dict):
        """Function which updates entries in the database.
           returns dict with modified/deleted/added database entries"""
        entries = self.build_db()
        dbremove = []
        # dbKey == id, dbValue dict of fileds
        for dbKey, dbValue in database:
            if dbValue["type"] == self.db_type:
                if dbValue["Name"] not in entries:
                    dbremove.append(dbKey)
                else:
                    # update all values managed by this module
                    for k, v in entries[dbValue["Name"]]:
                        dbValue[k] = v
        # remove no more existing entries
        for i in dbremove:
            database.pop(i)
        return database

    def build_menu(self, items: dict):
        """Builds the menu entries.
           return list of tuples (id, name, hits)"""
        # we only get entries of our app type so no problem here
        # json is already unjsonified
        NAME_PREFIX="run "
        NAME_POSTFIX=" (%PATH%)"
        entries = []
        for r in items:
            identifier=(NAME_PREFIX + r['Name'] + NAME_POSTFIX).replace("%PATH%", r['json']['Exec'])
            entries.append((r['ID'], identifier, r['hits']))
            if ("Terminal" not in r["json"]):
                r['json']["Terminal"] = "false"
            self._references[identifier] = (r['json']["Exec"], r['json']["Terminal"], r['file'], r['Name'])

        return entries

    def call(self, cmd: str):
        """Handles the selected entry"""
        # find the entry
        reference = list(filter(lambda x: cmd.startswith(x), self._references.keys()))
        entry = reference[0]
        cmd = cmd.replace(entry, "").lstrip()
        # Just call the program
        _subprocess.Popen(_shlex.split(self._expand_fieldcodes(self._references[entry][0], cmd, reference)),
                          encoding="utf-8",
                          shell=(self._references[entry][1] == "true"))

    def _scan_file(self, fi):
        entries = {}
        with open(fi, encoding="utf-8", mode="r") as f:
            data = {}
            for line in f:
                line = line.strip()
                if line.startswith("["):  # and line.rstrip() != "[Desktop Entry]":
                    data["header"] = line.strip("[]")
                    if "Name" in data and "Exec" in data:
                        data['file'] = fi
                        entries[data["Name"]] = data
                        data = {}
                if "=" in line:
                    s = line.split("=")
                    if "[" in s[0] and "]" in s[0]:
                        if "[" + self._lang + "]" in s[0]:
                            data[s[0].replace("[" + self._lang + "]", "").strip()] = s[1]
                    elif s[0] != "Name" or "Name" not in data.keys():
                        data[s[0]] = s[1]

            if "Name" in data:
                data['file'] = fi
                entries[data["Name"]] = data
        return entries

    def _expand_fieldcodes(self, entry: str, cmd: str, reference):
        fieldcodes = ['%f', '%F', '%u', '%U', '%i', '%c', '%k']  # todo implement %i as expand icon-key
        for fc in range(0, len(fieldcodes)):
            fieldcodes[fc] = fieldcodes[fc] in entry
        if True in fieldcodes:
            if '%k' in entry:
                entry = entry.replace('%k', '"' + reference[2] + "'")
            if '%c' in entry:
                entry = entry.replace('%c', '"' + reference[3] + "'")
            if '%i' in entry:
                entry = entry.replace(' %i', "")
            if '%f' in entry or '%F' in entry or '%u' in entry or '%U' in entry:
                entry = entry.replace('%f', cmd)
                entry = entry.replace('%F', cmd)
                entry = entry.replace('%u', cmd)
                entry = entry.replace('%U', cmd)
                cmd = ""
        return (entry + " " + cmd).rstrip()
