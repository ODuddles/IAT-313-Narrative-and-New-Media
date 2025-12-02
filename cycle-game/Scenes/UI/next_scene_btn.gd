extends Node2D

@export var next_scene: String

func _ready():
	$CanvasLayer/Control/Next.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(next_scene)

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		get_tree().change_scene_to_file(next_scene)
