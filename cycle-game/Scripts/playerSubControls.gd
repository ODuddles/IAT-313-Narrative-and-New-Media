extends CharacterBody2D

var place = 1
var prev_place = 1
var input_enabled = true
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	$AnimatedSprite2D.play("idle")

func move_to(target_position: Vector2, duration: float):
	input_enabled = false
	var tween := create_tween()
	tween.tween_property(self, "position", target_position, duration)
	await tween.finished
	input_enabled = true

func _physics_process(delta: float) -> void:
	var goal: Vector2 = Vector2.ZERO
	if not input_enabled:
		return
	var x_dir := Input.get_axis("ui_left", "ui_right")
	prev_place = place
	place += x_dir
	
	if place <= 0: 
		place = 0
		goal = Vector2(380, 670)
	elif place == 1:
		goal = Vector2(510, 670)
	elif place >= 2:
		place = 2
		goal = Vector2(640, 670)
		
	if prev_place != place:
		move_to(goal, 0.2)
