extends Node

export var characterName : String

export var hp : int = 100
export var maxHp : int = 100
export var mp : int = 50
export var maxMp : int = 50

export var xp : int = 0
export var level : int = 1

onready var playerUI = get_node("../CanvasLayer/playerUI")

func _ready():
	playerUI.updateNameTag(characterName)
	playerUI.updateHpTag(hp, maxHp)
	playerUI.updateMpTag(mp, maxMp)
	playerUI.updateLevel(level)
	playerUI.updateXp(xp)
	
