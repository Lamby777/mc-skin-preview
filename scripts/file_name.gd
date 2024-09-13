extends RichTextLabel

@export var FOCUSED_COLOR: Color

signal file_pressed(filename: String)

func _on_focus_entered():
    set("modulate", FOCUSED_COLOR)
    file_pressed.emit(text)

func _on_focus_exited():
    set("modulate", Color(1, 1, 1, 1))
