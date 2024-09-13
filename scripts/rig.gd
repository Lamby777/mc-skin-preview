extends Node3D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@export var mesh: MeshInstance3D

func _ready():
    anim_player.play("Walk")

func _on_ui_file_picked(filename):
    var dir = Global.prefs.get("baseFolder")
    if not dir:
        print("How did we get here?")
        return

    var full_path = dir + "/" + filename
    var image = Image.load_from_file(full_path)
    var material = mesh.get("surface_material_override/0")
    material.set("albedo_texture", ImageTexture.create_from_image(image))
