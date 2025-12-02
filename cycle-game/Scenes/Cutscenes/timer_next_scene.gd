extends Node2D

@export var time: float
@export var next_scene: String

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(time).timeout
	get_tree().change_scene_to_file(next_scene)
