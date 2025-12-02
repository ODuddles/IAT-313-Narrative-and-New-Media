extends Area2D

@export var squishy: AnimatedSprite2D
@export var dialogue: DialogueResource
@export var dialogue_start: String = "start"

var happened = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node) -> void:
	if body.name == "Player" and not happened:
		happened = true
		$ColorRect.visible = true
		squishy.visible = false
		await get_tree().create_timer(3).timeout
		$ColorRect.visible = false
		DialogueManager.show_dialogue_balloon(dialogue, dialogue_start)
