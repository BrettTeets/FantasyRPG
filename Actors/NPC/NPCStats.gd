extends Node

export var characterName : String

export var hp : int = 100
export var maxHp : int = 100
export var stats = [10, 10, 10, 10, 10, 10, 10]
export var attributes = [50, 50, 50, 50, 50, 50, 50, 50]

onready var nameTag = get_node("../npcNameTag3D")
onready var healthBar = get_node("../npcHealthBar3D")



func _ready():
	nameTag.updateNameTag(characterName)
	healthBar.updateHealthBar(hp, maxHp)
	
func updateHealthBar():
	healthBar.updateHealthBar(hp, maxHp)

func adjustHealth(amount):
	if hp - amount < 0:
		hp = 0
	else:
		hp -= amount
			
