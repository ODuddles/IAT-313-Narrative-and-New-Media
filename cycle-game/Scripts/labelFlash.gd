extends Label

@onready var timer: Timer = $Timer
@export var freq_time: float = 2
@export var invisible_time: float = 2

func _ready() -> void:
	timer.timeout.connect(_on_timeout)
	timer.start(freq_time)

func _on_timeout() -> void:
	self.visible = false
	await get_tree().create_timer(invisible_time).timeout
	self.visible = true
	
