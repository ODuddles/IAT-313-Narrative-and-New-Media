extends StaticBody2D

@export var bubble_scene: PackedScene  # assign WaveProjectile.tscn here
@onready var timer: Timer = $Timer

var offset_bubble: Vector2 = Vector2(0, 0)

func create_bubble():
	var bubble: CharacterBody2D = bubble_scene.instantiate()
	get_parent().add_child(bubble)  # add it to the scene
	bubble.position = global_position + offset_bubble
	print(bubble.position)

func _ready() -> void:
	timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	create_bubble()
