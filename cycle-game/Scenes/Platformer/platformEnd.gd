extends Area2D

var happened = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node) -> void:
	if body.name == "Player" and not happened:
		happened = true
		get_tree().change_scene_to_file("res://Scenes/Cutscenes/afterPlatform1.tscn")  
