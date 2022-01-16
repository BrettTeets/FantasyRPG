extends CenterContainer

export var inventoryControl = "string"
onready var container = get_node("Panel/VBoxContainer/scrollContainer/GridContainer")
	
func set_inventory(items):
	for i in items:
		var n = load(inventoryControl).instance()
		print(i.itemReference.texture)
		n.set_item(i.itemReference.texture, i.itemReference.stringId ,i.amount)
		container.add_child(n)
		
func clear_inventory():
	for n in container.get_children():
		container.remove_child(n)
	
	

