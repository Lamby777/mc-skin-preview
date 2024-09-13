extends Control

# The scene to instantiate for each file name label.
@export var LABEL_SCENE: PackedScene
@export var FILE_NAMES_CONTAINER: VBoxContainer
@export var FOLDER_PATH_BTN: Button
@export var FOLDER_DIALOG: FileDialog

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
    for child in get_children():
        if child is Label:
            child.queue_free()

    for file_name in file_names:
        print("Adding label for file name: " + file_name)
        var label = LABEL_SCENE.instantiate()
        label.text = file_name
        FILE_NAMES_CONTAINER.add_child(label)

func _on_folderopen_pressed():
    FOLDER_DIALOG.popup_centered()
    var path = await FOLDER_DIALOG.dir_selected

    print("Selected folder: " + path)
    Global.prefs["baseFolder"] = path
    Global.save_prefs()

    refresh_labels()
