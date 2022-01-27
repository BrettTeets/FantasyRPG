extends VBoxContainer

onready var toughText = get_node("tough")
onready var coolText = get_node("cool")
onready var punkText = get_node("punk")
onready var gothText = get_node("goth")
onready var prepText = get_node("prep")
onready var cuteText = get_node("cute")
onready var sportyText = get_node("sporty")

func set_stats(character):
	toughText.text = "Tough: " + str(character.get_style(global.STYLES.TOUGH))
	coolText.text = "Cool: " + str(character.get_style(global.STYLES.COOL))
	punkText.text = "Punk: " + str(character.get_style(global.STYLES.PUNK))
	gothText.text = "Goth: " + str(character.get_style(global.STYLES.GOTH))
	prepText.text = "Prep: " + str(character.get_style(global.STYLES.PREP))
	cuteText.text = "Cute: " + str(character.get_style(global.STYLES.CUTE))
	sportyText.text = "Sporty: " + str(character.get_style(global.STYLES.SPORTY))
