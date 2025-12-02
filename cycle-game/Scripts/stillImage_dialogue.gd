extends Node2D

@export var dialogue: DialogueResource
@export var dialogue_start: String = "start"
@export var next_scene: String

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue, dialogue_start)
	DialogueManager.dialogue_ended.connect(_on_dialogue_finished)

func _on_dialogue_finished(_dialogue_resource) -> void:
	get_tree().change_scene_to_file(next_scene)
