extends Node

export var characterName : String

export var hp : int = 100
export var maxHp : int = 100
export var mp : int = 50
export var maxMp : int = 50
export var defense : int = 10

export var xp : int = 0
export var level : int = 1

onready var playerUI = get_node("../CanvasLayer/playerUI")
onready var equipment = get_node("../humanEquipment")
onready var inventory = get_node("../characterInventory")

func _ready():
	playerUI.updateNameTag(characterName)
	playerUI.updateHpTag(hp, maxHp)
	playerUI.updateMpTag(mp, maxMp)
	playerUI.updateLevel(level)
	playerUI.updateXp(xp)
	temp_set_torso()
	print("Defense is " + str(get_defense()))
	
	
func get_defense():
	return defense + equipment.tally_defense();
	
func temp_set_torso():
	var shirt = inventory.get_item(2)
	equipment.set_torso(shirt.itemReference)
	
