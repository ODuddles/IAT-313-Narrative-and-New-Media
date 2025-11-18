extends Area2D

var direction : Vector2 = Vector2.DOWN 
var speed: float = 10

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta: float) -> void:
	position += direction.normalized() * speed * delta

# Called when the node enters the scene tree for the first time.
func set_speed(new_speed: float) -> void:
	speed = new_speed

func _on_body_entered(body):
	# Check if the body is your main character
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/black_screen.tscn")
	queue_free() 
