extends Node2D

@export var song: String
@export var next_scene: String
@export var time: float

func _ready():
	MusicManager.play_music(song, 0)
	await get_tree().create_timer(time).timeout
	MusicManager.stop_music()
	get_tree().change_scene_to_file(next_scene)
