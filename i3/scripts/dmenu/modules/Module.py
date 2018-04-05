class Module(object):
    """Abstract class, implement: build_db, update_db, build_menu, call"""

    def __init__(self, obj):
        pass

    def build_db():
        """Function which adds entries to the database.
           returns dict with:
           Name, json, disabled, type, "file" """
        raise NotImplementedError("Should have implemented this")

    def update_db(database: dict):
        """Function which updates entries in the database.
           returns dict with modified/deleted/added database entries"""
        raise NotImplementedError("Should have implemented this")

    def build_menu(items: dict):
        """Builds the menu entries.
           return list of tuples (id, name, hits)"""
        raise NotImplementedError("Should have implemented this")

    def call(entry: str):
        """Handles the selected entry"""
        raise NotImplementedError("Should have implemented this")
