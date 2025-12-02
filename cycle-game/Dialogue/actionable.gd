extends Area2D

@export var dialogue: DialogueResource
@export var dialogue_start: String = "start"

func action() -> void:
	DialogueManager.show_dialogue_balloon(dialogue, dialogue_start)
