extends Control

onready var label = get_node("Panel/Label")

func updateNameTag(text):
	label.text = text;
