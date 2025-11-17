extends Area2D

var speed : float = 300
var direction : Vector2 = Vector2.RIGHT  # default

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta: float) -> void:
	position += direction.normalized() * speed * delta

func set_direction(new_direction: Vector2) -> void:
	direction = new_direction

func _on_body_entered(body):
	# Check if the body is your main character
	if body.name == "Player":
		body.take_damage_water(direction)  # call your player's damage function
	queue_free()        # remove the bullet
	
