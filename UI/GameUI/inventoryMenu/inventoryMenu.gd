extends Control

var itemSquare = "res://UI/GameUI/inventoryMenu/itemSquare.tscn";
onready var container = get_node("back/vAlign/sAlign/gAlign")
	
func set_inventory(items, inventory):
	var square = load(itemSquare)
	var count = 0;
	for i in items:
		var n = square.instance();
		n.slotIndex = count;
		n.connect("droppedItem", inventory, "swap_slots")
		container.add_child(n)
		# if it has something in it, fill in the data.
		if i:
			n.set_item(i.source.texture, i.source.stringId ,i.amount)
		count += 1;
		
func clear_inventory():
	for n in container.get_children():
		container.remove_child(n)
	
	

