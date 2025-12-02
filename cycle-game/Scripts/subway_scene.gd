extends Node2D

@export var box: PackedScene  
@export var gravity = 200
@export var freq_time: float = 4
@export var game_time: float = 60
@onready var timer: Timer = $Timer
@onready var survive_timer: Timer = $Survive_timer

var starting_positions: Array[Vector2] = [Vector2(380, -50), Vector2(510, -50), Vector2(640, -50)]
var gravity_initial: float
var freq_time_initial: float

func spawn_box():
	var box: Area2D = box.instantiate()
	box.scale = Vector2(5, 5)
	box.position = starting_positions.pick_random()
	box.set_speed(gravity)
	get_parent().add_child(box)  

func _ready() -> void:
	freq_time_initial = freq_time
	gravity_initial = gravity
	timer.timeout.connect(_on_timeout)
	timer.start(freq_time)
	survive_timer.timeout.connect(_on_victory)
	survive_timer.start(game_time)

func _on_timeout() -> void:
	spawn_box()
	var n = survive_timer.time_left
	timer.wait_time = freq_time_initial - (((game_time - n) / game_time) * 1)
	timer.start()
	gravity = ((game_time - n) / game_time) * 200 + gravity_initial
	
func _on_victory() -> void:
	get_tree().change_scene_to_file("res://Scenes/Cutscenes/afterSubwaySurfer.tscn")
