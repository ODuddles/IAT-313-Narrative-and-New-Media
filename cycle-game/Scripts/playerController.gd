extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0
const KNOCKBACK_DURATION = 1

var knockback_timer = 0
var knockback_velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if knockback_timer > 0:
		velocity = knockback_velocity
		knockback_timer -= delta
		
	# Add gravity
	if not is_on_floor():
		velocity.y += get_gravity().y * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle horizontal movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0 and knockback_timer <= 0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0  # Flip sprite when moving left
	elif knockback_timer <= 0:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Animation logic
	if velocity.x == 0 and is_on_floor():
		$AnimatedSprite2D.play("idle")
	elif not is_on_floor():
		var last_frame = $AnimatedSprite2D.sprite_frames.get_frame_count("jump") - 1
		if $AnimatedSprite2D.frame == last_frame:
			$AnimatedSprite2D.stop()
			$AnimatedSprite2D.frame = last_frame
		else:
			$AnimatedSprite2D.play("jump")
	else:
		$AnimatedSprite2D.play("walking")

func take_damage_water(direction: Vector2) -> void:
	$AnimatedSprite2D.flip_h = direction.x < 0
	
	# Horizontal knockback opposite to hit direction
	knockback_velocity = Vector2(direction.x * SPEED * 2, JUMP_VELOCITY * 0.6)
	velocity = knockback_velocity
	knockback_timer = KNOCKBACK_DURATION
