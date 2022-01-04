extends Control

onready var nameTag = get_node("Panel/nameTag")
onready var hpBar = get_node("Panel/hpTag/hpBar")
onready var mpBar = get_node("Panel/mpTag/mpBar")
onready var levelTag = get_node("Panel/levelTag")
onready var xpTag = get_node("Panel/xpTag")

func updateNameTag(text):
	nameTag.text = text;

func updateHpTag(amount, total):
	hpBar.value = (100 / total) * amount

func updateMpTag(amount, total):
	mpBar.value = (100 / total) * amount

func updateLevel(level):
	levelTag.text = "Level: " + str(level)

func updateXp(xp):
	xpTag.text = "XP: " + str(xp)
