extends Node2D

@onready var timer: Timer = $Timer

@export var size: Vector2 = Vector2(40, 200)   # Rectangle size
@export var border_color: Color = Color.BLACK
@export var fill_color: Color = Color.RED
@export var fill_step: float = 0.04            # Amount filled per click (0.0–1.0)

var difficulty: float = 0.3 #Acts as a spring constant
var fill_amount: float = 0.0  # Current fill percentage (0.0 = empty, 1.0 = full)

# Handles the protocol when the mouse button is pressed
func _input(event):
	if event is InputEventKey and event.pressed:
		if fill_amount >= 1.0:
			timer.stop()
			fill_amount = 1.0
			queue_redraw()
			print("WINNNN")
		else: 
			if fill_amount > 0:
				fill_amount = fill_amount + fill_step
			elif fill_amount <= 0:
				fill_amount = 0.05
			queue_redraw() # Redraw

# Redraws the bar based on the current score/status
func _draw():
	# Draw border
	draw_rect(Rect2(Vector2.ZERO, size), border_color, false)
	
	var inner_position = Vector2(1, 1)
	var inner_size = size - Vector2(2, 2)
	var filled_height = inner_size.y * fill_amount
	
	# Draw fill inside the border
	draw_rect(Rect2(inner_position, Vector2(inner_size.x, filled_height)), fill_color)
	
func _ready() -> void:
	timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	fill_amount -= 0.01
	queue_redraw()
	timer.wait_time = max(difficulty * (1 - fill_amount), 0.04)
