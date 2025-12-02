extends Node2D

@onready var music_player = $MusicPlayer
var current_track = "res://Sounds/cloudy.wav"
var volume_g: float = 0
var loop_g: bool = false
var loop_time_g: float = -1

@export var loop_timer: Timer

#plays music with given stream path and volume
# optional arguments loop (allows for looping the track)
# loop_time allows to set a time up until the track plays and then starts again
func play_music(stream_path, volume: float, loop: bool = false, loop_time: float = -1):
	stop_music()
	volume_g = volume
	loop_g = loop
	loop_time_g = loop_time
	current_track = stream_path
	music_player.stream = load(stream_path)
	music_player.volume_db = volume
	music_player.play()
	if loop_time < 0:
		music_player.finished.connect(Callable(self._on_music_finished))
	else:
		loop_timer.one_shot = true
		loop_timer.wait_time = loop_time
		loop_timer.start()
		loop_timer.timeout.connect(Callable(self, "_on_music_finished"))

func set_volume(volume: float):
	music_player.volume_db = volume

func stop_music():
	loop_timer.stop()
	music_player.stop()
	
func resume_music():
	music_player.stream = load(current_track)
	music_player.play()

func is_playing() -> bool:
	return music_player.playing

func _on_music_finished():
	play_music(current_track, volume_g, loop_g, loop_time_g)
