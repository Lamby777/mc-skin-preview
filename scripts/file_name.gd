extends RichTextLabel

@export var FOCUSED_COLOR: Color

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _on_focus_entered():
    set("modulate", FOCUSED_COLOR)


func _on_focus_exited():
    set("modulate", Color(1, 1, 1, 1))
