extends Node2D

@export var box: PackedScene  
@export var gravity = 200
@export var freq_time: float = 2
@onready var timer: Timer = $Timer

var starting_positions: Array[Vector2] = [Vector2(380, -50), Vector2(510, -50), Vector2(640, -50)]

func spawn_box():
	var box: Area2D = box.instantiate()
	box.scale = Vector2(5, 5)
	box.position = starting_positions.pick_random()
	box.set_speed(gravity)
	get_parent().add_child(box)  

func _ready() -> void:
	timer.timeout.connect(_on_timeout)
	timer.start(freq_time)

func _on_timeout() -> void:
	spawn_box()
