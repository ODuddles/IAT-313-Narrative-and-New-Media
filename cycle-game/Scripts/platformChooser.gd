extends StaticBody2D

@export var platform_type: String = "Long"

# If -1 or 0 then a random of given type will be chosen
@export var platform_nr: int = -1
@onready var long_arr: Array[Sprite2D] = [$Long/Opt1, $Long/Opt2]
@onready var short_arr: Array[Sprite2D] = [$Short/Opt3, $Short/Opt4, $Short/Opt5]

func turnoff_all_vis() -> void:
	for sprite in long_arr:
		sprite.visible = false
	
	for sprite in short_arr:
		sprite.visible = false
	
	$Long.disabled = true
	$Short.disabled = true

func long_platform() -> void:
	$Long.disabled = false
	if platform_nr == 1:
		$Long/Opt1.visible = true 
	elif platform_nr == 2:
		$Long/Opt2.visible = true
	else:
		long_arr.pick_random().visible = true
	
func short_platform() -> void:
	$Short.disabled = false
	if platform_nr == 3:
		$Short/Opt3.visible = true
	elif platform_nr == 4:
		$Short/Opt4.visible = true
	elif platform_nr == 5:
		$Short/Opt5.visible = true
	else:
		short_arr.pick_random().visible = true
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turnoff_all_vis()
	if platform_type == "Long":
		long_platform()
	elif platform_type == "Short":
		short_platform()
	else:
		push_warning("Unknown platform type")
	
	
