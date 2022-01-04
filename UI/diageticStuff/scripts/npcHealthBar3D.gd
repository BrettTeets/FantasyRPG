extends Sprite3D

onready var bar = $Viewport/health_bar_2d

func _ready():
	texture = $Viewport.get_texture()
	
func update_health_bar(hp, max_hp):
	bar.update_health_bar(hp, max_hp);
