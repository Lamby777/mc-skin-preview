extends Node

@export var prefs = {}

func save_prefs(data):
    var save_file = FileAccess.open("user://prefs.save", FileAccess.WRITE)
    save_file.store_string(JSON.stringify(data))

func load_prefs():
    var save_file = FileAccess.open("user://prefs.save", FileAccess.READ)

    if save_file:
        prefs = JSON.parse_string(save_file.get_as_text())
    else:
        prefs = {}

func _ready():
    save_prefs({"baseFolder": "/home/refcherry/Pictures/MCSkins/"})

    print("Loading preferences...")
    Global.load_prefs()
    print("Preferences loaded.")
