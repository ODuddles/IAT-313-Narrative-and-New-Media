extends Node2D

@onready var music_player = $MusicPlayer
var current_track = "res://Sounds/cloudy.wav"

func play_music(stream_path, volume: float):
	stop_music()
	current_track = stream_path
	music_player.stream = load(stream_path)
	music_player.volume_db = volume
	music_player.play()

func stop_music():
	music_player.stop()
	
func resume_music():
	music_player.stream = load(current_track)
	music_player.play()

func is_playing() -> bool:
	return music_player.playing
