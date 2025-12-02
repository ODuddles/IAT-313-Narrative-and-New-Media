extends Node2D

@export var dialogue: DialogueResource
@export var dialogue_start: String = "start"
var transporting = "res://Sounds/truck.mp3"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(transporting, 6)
	DialogueManager.show_dialogue_balloon(dialogue, dialogue_start)
	DialogueManager.dialogue_ended.connect(_on_dialogue_finished)

func _on_dialogue_finished(dialogue_resource):
	MusicManager.stop_music()
	get_tree().change_scene_to_file("res://Scenes/Platformer/platformer.tscn") 
