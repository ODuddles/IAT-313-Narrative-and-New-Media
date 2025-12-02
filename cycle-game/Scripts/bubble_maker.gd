extends StaticBody2D

@export var bubble_scene: PackedScene  
@onready var timer: Timer = $Timer

var offset_bubble: Vector2 = Vector2(0, -100)

func create_bubble():
	var bubble: CharacterBody2D = bubble_scene.instantiate()
	var animName = "make"
	$AnimatedSprite2D.play(animName)
	await $AnimatedSprite2D.animation_finished
	get_parent().add_child(bubble) 
	bubble.position = global_position + offset_bubble

func _ready() -> void:
	timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	create_bubble()
