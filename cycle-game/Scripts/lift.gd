extends CharacterBody2D

var activated := false

func _ready():
	$CollisionShape2D/LandingArea.body_entered.connect(_on_body_entered)
	print("ready")

func _on_body_entered(body):
	if activated:
		return

	if body.name == "Player":
		activated = true
		$AnimationPlayer.play("move")
