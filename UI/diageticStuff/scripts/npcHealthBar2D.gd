extends Control

onready var bar = get_node("TextureProgress")

func updateHealthBar(hp, max_hp):
	bar.value = (100 / max_hp) * hp;
