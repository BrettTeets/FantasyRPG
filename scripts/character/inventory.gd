extends Node

#Holds all the item resource files. for quick reference.
onready var itemDatabase = get_node("/root/gameManager/itemDatabase")

#Actually stores all the items in a flat array.
var heldItems = Array()

#gets all the items in the inventory
func get_items():
    return heldItems;

#finds the index of an item by the items name.
func find_item_index(stringId):
    var c = 0
    for i in heldItems:
        if i.stringId == stringId:
            return c
        else:
            c += 1

#gets an item by its index in the held items, ideally use find item index first.
func get_item(index):
    return heldItems[index]

#loops through and removes and item, returns boolean indicating success.
func remove_item(stringId, amount):
    if amount <= 0:
        print("Error: Invalid number of items requested")
        return false;
    if amount > count_items(stringId):
        print("Error: Requested more items that avalible");
        return false;
    
    #Loop through and decrement the appropriote item stacks if they run out mark them for removal.
    var remainder = amount;
    var remove = Array()
    for i in heldItems:
        if remainder > 0:
            if i.itemReference.stringId == stringId:
                if i.amount > remainder:
                    i.amount -= remainder;
                    remainder = 0;
                else:
                    remainder -= i.amount;
                    remove.append(i);
        else:
            break;

    #now remove the emptied items.
    for r in remove:
        heldItems.erase(r)
    
    return true;
    
#method to get an item by name, remove a certian amount from it.
func count_items(stringId):
    var count = 0;
    for i in heldItems:
        if i.itemReference.stringId == stringId:
            count += i.amount;
    return count;

#adds an item. Uses the stringId to find the correct item to add.
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
		
#Loops through existing items and tries to fill them with the new item.
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


