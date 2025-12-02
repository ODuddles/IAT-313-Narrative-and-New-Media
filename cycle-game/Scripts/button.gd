extends Button

@export var normal_icon: Texture2D
@export var hover_icon: Texture2D

func _ready() -> void:
	mouse_entered.connect(_on_hover)
	mouse_exited.connect(_on_leave)
	icon = normal_icon

func _on_hover() -> void:
	icon = hover_icon

func _on_leave() -> void:
	icon = normal_icon
