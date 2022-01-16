extends CenterContainer

export var inventoryControl = "string"
onready var container = get_node("backing/vAlign/hAlign/sAlign/itemList")
onready var defenseState = get_node("backing/vAlign/hAlign/currentStats/defenseStat")
	
func set_inventory(items):
	for i in items:
		if i.itemReference.type == Constants.itemType.EQUIPMENT:
			var n = load(inventoryControl).instance()
			print(i.itemReference.texture)
			n.set_item(i.itemReference.texture, i.itemReference.stringId , i.itemReference.slotName)
			container.add_child(n)

func clear_inventory():
	for n in container.get_children():
		container.remove_child(n)
		

func set_stats(defense):
	defenseState.text = "defense: " + str(defense)
	
