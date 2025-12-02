extends Node2D

@export var wave_scene: PackedScene  
@export var projectile_speed = 200
@export var shoot_on: bool = true
@export var freq_time: float = 4
@export var initial_time: float = 2
@onready var timer: Timer = $Timer
@onready var animPlayer = $AnimationPlayer

var offset_water = Vector2(-200, -25)
var anim_name = "shoot"

func fire_wave(direction: Vector2):
	var wave: Area2D = wave_scene.instantiate()
	wave.scale = Vector2(0.2, 0.2)
	wave.position = global_position + offset_water
	wave.set_direction(direction)
	wave.set_speed(projectile_speed)
	animPlayer.play(anim_name)
	
	while 1:
		var finished_anim = await $AnimationPlayer.animation_finished
		if finished_anim == anim_name:
			break
	get_parent().add_child(wave) 

func _ready() -> void:
	await get_tree().create_timer(initial_time).timeout
	timer.timeout.connect(_on_timeout)
	timer.start(freq_time)
	animPlayer.speed_scale = 6

func _on_timeout() -> void:
	if shoot_on:
		fire_wave(Vector2.LEFT)
