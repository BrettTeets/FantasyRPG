extends Sprite3D

onready var bar = $Viewport/npcHealthBar2D

func _ready():
	texture = $Viewport.get_texture()
	
func updateHealthBar(hp, max_hp):
	bar.updateHealthBar(hp, max_hp);
