extends RichTextLabel

@export var FOCUSED_COLOR: Color
@export var FILENAME: String

signal pressed(filename: String)

func _on_focus_entered():
    set("modulate", FOCUSED_COLOR)
    pressed.emit(FILENAME)

func _on_focus_exited():
    set("modulate", Color(1, 1, 1, 1))
