extends CenterContainer

var inventoryControl = "res://UI/GameUI/inventoryMenu/inventoryItemBox.tscn";
onready var container = get_node("back/vAlign/sAlign/gAlign")
	
func set_inventory(items):
	for i in items:
		var n = load(inventoryControl).instance()
		print(i.itemReference.texture)
		container.add_child(n)
		n.set_item(i.itemReference.texture, i.itemReference.stringId ,i.amount)
		
func clear_inventory():
	for n in container.get_children():
		container.remove_child(n)
	
	

