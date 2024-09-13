extends Node3D

@export var UI: Control

func _ready():
    var prefs = Global.load_prefs()
    print("Prefs: ", prefs)
