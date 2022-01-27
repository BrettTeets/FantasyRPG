extends Control

onready var nameTag = get_node("Panel/nameTag")

func updateNameTag(text):
	nameTag.text = text;
