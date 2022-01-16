extends Node

#Holds all the item resource files. for quick reference.
onready var itemDatabase = get_node("/root/gameManager/itemDatabase")

#Actually stores all the items in a flat array.
var heldItems = Array()

