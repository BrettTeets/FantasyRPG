extends Sprite3D

onready var nameTag = get_node("Viewport/npcNameTag2D")

func _ready():
	texture = $Viewport.get_texture()

func updateNameTag(text):
	nameTag.updateNameTag(text)
