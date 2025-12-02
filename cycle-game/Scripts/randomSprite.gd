extends Sprite2D
@export var spriteImage1: Texture
@export var spriteImage2: Texture

func _ready() -> void:
	var textures : Array[Texture2D] = [
	spriteImage1,
	spriteImage2
	]
	
	var chosen_texture = textures.pick_random()
	self.texture = chosen_texture
	self.scale = Vector2(0.07, 0.07)
