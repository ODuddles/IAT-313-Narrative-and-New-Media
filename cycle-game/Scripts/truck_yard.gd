extends Node2D

var transporting = "res://Sounds/truck.mp3"

func _ready() -> void:
		MusicManager.play_music(transporting, 6)
		$AnimationPlayer.play("truckMove")
		await $AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://Scenes/Cutscenes/transporting.tscn") 
