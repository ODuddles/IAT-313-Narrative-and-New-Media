extends Node2D

@export var wave_scene: PackedScene  # assign WaveProjectile.tscn here
@export var projectile_speed = 200
@onready var timer: Timer = $Timer

var offset_water = Vector2(-110, -25)

func fire_wave(direction: Vector2):
	var wave: Area2D = wave_scene.instantiate()
	wave.position = global_position + offset_water
	wave.set_direction(direction)
	get_parent().add_child(wave)  # add it to the scene

func _ready() -> void:
	timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	fire_wave(Vector2.LEFT)
