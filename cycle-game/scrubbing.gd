extends Node2D

var animPlayer
var playback_speed: float = 10

func _ready():
	animPlayer = $Area2D/AnimationPlayer
	animPlayer.play("scrub")
	
func set_playback_speed(speed: float):
	animPlayer.speed_scale = speed
