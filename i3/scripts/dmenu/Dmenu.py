#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import json
import subprocess


class Dmenu(object):
    def __init__(self, items: list):
        with open(os.path.dirname(sys.argv[0]) + "/dmenu.json") as fp:
            self._dmenu = json.load(fp)["dmenu"]
        self._items = items

    def run(self):
        """Returns (exitCode, stdout)"""
        p1 = subprocess.run(self._dmenu, input="\n".join(self._items), encoding="utf-8", stdout=subprocess.PIPE)
        return (p1.returncode, p1.stdout)
