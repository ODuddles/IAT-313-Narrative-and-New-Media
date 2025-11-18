extends Node2D

@export var wave_scene: PackedScene  
@export var projectile_speed = 200
@export var shoot_on: bool = true
@export var freq_time: float = 4
@export var initial_time: float = 2
@onready var timer: Timer = $Timer

var offset_water = Vector2(-110, -25)

func fire_wave(direction: Vector2):
	var wave: Area2D = wave_scene.instantiate()
	wave.position = global_position + offset_water
	wave.set_direction(direction)
	wave.set_speed(projectile_speed)
	get_parent().add_child(wave)  # add the object to the scene

func _ready() -> void:
	await get_tree().create_timer(initial_time).timeout
	timer.timeout.connect(_on_timeout)
	timer.start(freq_time)

func _on_timeout() -> void:
	if shoot_on:
		fire_wave(Vector2.LEFT)
