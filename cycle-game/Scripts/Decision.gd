extends Control

@export var dialogue: DialogueResource
@export var dialogue_start: String = "start"

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue, dialogue_start)
