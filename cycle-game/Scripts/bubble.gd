extends CharacterBody2D

func _ready():
	$AnimationPlayer.play("move")
	$AnimationPlayer.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "move":
		queue_free()
