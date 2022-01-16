extends Node

export var heldItems = Array()

#Holds all the item resource files. for quick reference.
onready var itemDatabase = get_node("/root/gameManager/itemDatabase")

func _ready():
	print("ready")
	add_item("potion", 16)
	add_item("shirt", 2)
	print(heldItems)

func get_items():
	return heldItems

func find_item_index(stringId):
	var c = 0
	for i in heldItems:
		if i.stringId == stringId:
			return c
		else:
			c += 1
	
func get_item(index):
	return heldItems[index]
	
func remove_item(index):
	heldItems.remove[index] 

func add_item(stringId, amount):
	if amount <= 0:
		print("cant add a negative number of items")
		return
	
	var item = itemDatabase.get_item(stringId)
	if not item:
		print("item not in database.")
		return
		
	if item.stackSize > 1:
		amount = _add_to_existing_items(item, amount)
	if amount > 0:
		_add_new_items(item, amount)
			
#loops through and adds new items, filling the stacks as it goes.
#this should leave nothing left in the remainder.
func _add_new_items(item, remainder):
	while remainder > 0:
		var newItem = {
			itemReference = item, 
			amount = min(remainder, item.stackSize)
		}
		heldItems.append(newItem)
		remainder -= newItem.amount
		
#Loops through existing items and tries to fill them with th enew item.
#this should return what ever it could not fill as a new remainder.
func _add_to_existing_items(item, remainder):
	for i in range(heldItems.size()):
		if remainder == 0:
			break
		var selectedItem = heldItems[i]
		if selectedItem.itemReference.stringId != item.stringId:
			continue
		
		if selectedItem.amount < item.stackSize:
			var diff = item.stackSize - selectedItem.amount
			if remainder <= diff:
				selectedItem.amount += remainder
				remainder = 0
			else:
				selectedItem.amount += diff
				remainder -= diff
	return remainder
