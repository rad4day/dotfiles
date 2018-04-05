from .Module import Module as _Module
import locale as _locale
from pathlib import Path as _Path
from Dmenu import Dmenu
import subprocess as _subprocess


class MPC(_Module):

    def __init__(self):
        self.db_type = "MPC"
        self._home = str(_Path.home())
        self._lang = _locale.getlocale()[0].split("_")[0].strip()
        self._dirs = ["/usr/share/applications", self._home + "/.local/share/applications"]
        self.replace = True

    def build_db(self):
        """Function which adds entries to the database.
           returns dict with:
           Name, json, disabled, type, "file" """

        # we only add an generic Submenu entry.
        db = {"Media Player Control [MPC]": {
            "Name": "Media Player Control [MPC]",
            "json": "",
            "disabled": False,
            "file": "none",
            "type": self.db_type
        }}
        return db

    def update_db(self, database: dict):
        """Function which updates entries in the database.
           returns dict with modified/deleted/added database entries"""
        return self.build_db()

    def build_menu(self, items: dict):
        """Builds the menu entries.
           return list of tuples (id, name, hits)"""
        # we only get entries of our app type so no problem here
        # json is already unjsonified
        entries = []
        for r in items:
            entries.append((r['ID'], r['Name'], r['hits']))

        return entries

    def gatherInfo(self):
            out = {}
            infoprocess = _subprocess.run("mpc", stdout=_subprocess.PIPE, shell=True)
            info = infoprocess.stdout.decode("utf8").split("\n")
            if len(info) == 4:
                status = [x.split(":") for x in info[2].split("  ")]

                out["song"] = info[0]
                out["playing"] = "[playing]" in info[1]

            else:
                status = [x.split(":") for x in info[0].split("  ")]

            out["replace"] = self.replace
            status = [x for x in status if len(x) == 2]

            for i in status:
                i[0] = i[0].strip()
                i[1] = i[1].strip()
                if i[1] == "off":
                    out[i[0]] = False
                elif i[1] == "on":
                    out[i[0]] = True
                else:
                    out[i[0]] = i[1]
            return out

    def buildStatusMenu(self):
        info = self.gatherInfo()
        if info["replace"]:
            playlists = ['MODE: REPLACE']
        else:
            playlists = ['MODE: APPEND']

        if info["random"]:
            playlists += ['RANDOM: on']
        else:
            playlists += ['RANDOM: off']

        return (len(playlists), playlists)

    def handleStatusMenu(self, text: str):
        if text.startswith("MODE: "):
            self.replace = not self.replace
        elif text.startswith("RANDOM: "):
            _subprocess.run("mpc random", shell=True)

    def call(self, cmd: str):
        """Handles the selected entry"""
        # our menu entry was selected, time to create and show the submenu
        while True:
            infolen, playlists = self.buildStatusMenu()

            playprocess = _subprocess.run("mpc lsplaylists", stdout=_subprocess.PIPE, shell=True)
            playlists += playprocess.stdout.decode("utf8").split("\n")
            menu = Dmenu(playlists)
            ex = menu.run()

            if ex[0] == 0:
                if ex[1].rstrip() in playlists[0:infolen]:
                    self.handleStatusMenu(ex[1].rstrip())
                    continue
                # user selected an entry
                # mpc clear(?) -> mpc load ex[1] -> mpc play
                command = "mpc load '" + ex[1].rstrip() + "'"
                if self.replace:
                    command = "mpc clear; " + command + "; mpc play"
                _subprocess.run(command, shell=True)
                break
            else:
                break
