extends Control

onready var bar = get_node("TextureProgress")

func update_health_bar(hp, max_hp):
	bar.value = (100 / max_hp) * hp;
