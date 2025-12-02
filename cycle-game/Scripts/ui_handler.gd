
extends Control

@onready var menu = $Menu
@onready var quit = $Quit
@onready var home = $Home
@onready var retry = $Retry
@onready var back = $Back
@onready var mute = $Mute
@onready var unmute = $Unmute

# sets the ui to how it looks while playing
func set_ui_in_game() -> void:
	quit.hide()
	home.hide()
	retry.hide()
	back.hide()
	menu.show()

func _ready():
	set_ui_in_game()
	mute.hide()
	quit.pressed.connect(_on_quit_button_pressed)
	menu.pressed.connect(_on_menu_button_pressed)
	home.pressed.connect(_on_home_button_pressed)
	retry.pressed.connect(_on_retry_button_pressed)
	back.pressed.connect(_on_back_button_pressed)
	mute.pressed.connect(_on_mute_button_pressed)
	unmute.pressed.connect(_on_unmute_button_pressed)

func _on_menu_button_pressed() -> void:
	menu.hide()
	quit.show()
	retry.show()
	home.show()
	back.show()
	
func _on_back_button_pressed() -> void:
	set_ui_in_game()

func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_mute_button_pressed() -> void:
	MusicManager.resume_music()
	mute.hide()
	unmute.show()

func _on_unmute_button_pressed() -> void:
	MusicManager.stop_music()
	mute.show()
	unmute.hide()
