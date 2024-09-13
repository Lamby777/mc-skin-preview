extends Control

# The scene to instantiate for each file name label.
@export var LABEL_SCENE: PackedScene
@export var FILE_NAMES_CONTAINER: VBoxContainer
@export var FOLDER_PATH_BTN: Button
@export var FOLDER_DIALOG: FileDialog

signal file_picked(filename: String)

func _ready():
    refresh_labels()

func get_file_names():
    var folder = Global.prefs.get("baseFolder")
    if not folder:
        return []
    return DirAccess.open(folder).get_files()

func refresh_labels():
    FOLDER_PATH_BTN.text = Global.prefs.get("baseFolder", "<SELECT FOLDER>")

    var file_names = get_file_names()

    # Remove all existing labels.
    for child in FILE_NAMES_CONTAINER.get_children():
        if child is RichTextLabel:
            child.queue_free()

    for filename in file_names:
        var label = LABEL_SCENE.instantiate()
        label.text = filename
        label.connect("file_pressed", on_file_picked)
        FILE_NAMES_CONTAINER.add_child(label)

func on_file_picked(filename: String):
    # Refresh to update the labels in case new stuff got added/removed
    # refresh_labels()

    file_picked.emit(filename)

func _on_folderopen_pressed():
    FOLDER_DIALOG.popup_centered()
    var path = await FOLDER_DIALOG.dir_selected

    print("Selected folder: " + path)
    Global.prefs["baseFolder"] = path
    Global.save_prefs()

    refresh_labels()
