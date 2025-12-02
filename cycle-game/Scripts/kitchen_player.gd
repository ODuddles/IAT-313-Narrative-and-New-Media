extends CharacterBody2D

@onready var actionable = $Actionable
const SPEED = 100
var triggered: bool = false

func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_finished)


func _physics_process(delta: float) -> void:
	var directionHorizontal := Input.get_axis("ui_left", "ui_right")
	var directionVertical := Input.get_axis("ui_up", "ui_down")
	var direction: Vector2 = Vector2(directionHorizontal, directionVertical).normalized()
	var actionables = actionable.get_overlapping_areas()
	if actionables.size() > 0 and not triggered:
		actionables[0].action()
		triggered = true
		$AnimatedSprite2D.stop()
		return
		
	if triggered:
		return
	
	$AnimatedSprite2D.flip_h = directionHorizontal < 0 
	
	if direction:
		$AnimatedSprite2D.play("stumble")
	else:
		$AnimatedSprite2D.stop()
	velocity = direction * SPEED
	move_and_slide()

func _on_dialogue_finished(dialogue_resource):
	get_tree().change_scene_to_file("res://Scenes/Clicker/clicker.tscn")
	#triggered = false
	#var tween = get_tree().create_tween()
	#tween.tween_property(self, "position:y", self.position.y + 200, 0.5)
