extends Area2D

@export var crane: StaticBody2D

var activated := false

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if activated:
		return

	if body.name == "Player":
		activated = true
		crane.startMove()
