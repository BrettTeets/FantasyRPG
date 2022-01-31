extends Reference
class_name inventoryAspect

var inventory = Array();
var size = 7;

func _init():
	for i in range(size):
		inventory.append(null);

func get_all_items():
	return inventory;

#this will add the item until the inventory is filled and return the remainder.
func add_item(stringId, amount):
	assert(amount > 0) # cant add 0 items or negative items.
	var resource = ItemDatabase.get_item(stringId);
	assert(resource) #cant add an item that doesn't exist.

	if resource.stackSize > 1:
		amount = _fill_existing_slots(resource, amount);
	if amount > 0:
		amount = _fill_empty_slots(resource, amount)
	return amount;

func _fill_empty_slots(resource, amount):
	while amount > 0:
		if _has_empty_slot():
			var emptyIndex = _find_empty_slot()
			var newItem = stock.new(resource, min(amount, resource.stackSize))
			inventory[emptyIndex] = newItem;

			amount -= newItem.amount;
		else:
			return amount;

func _fill_existing_slots(resource, amount):
	for i in inventory:
		if amount == 0: #if there nothing left we are done.
			break;
		if not i: #if its empty nothing to do.
			continue;
		if i.source.stringId != resource.stringId: #if its not the same type then skip.
			continue;
		
		if i.amount < resource.stackSize: #if the amount in this slot is less than the stack size, lets fill it.
			var diff = resource.stackSize - i.amount;
			if amount <= diff: #if the amount is left will fit in the remain space fill it.
				i.amount += amount;
				amount = 0;
			else: #otherwise fill up the amount to the stacksize and reduce the remaining amount.
				i.amount += diff;
				amount -= diff;
	return amount;

#this will just remove the items, it does not return anything.
func remove_item(stringId, amount):
	assert(amount > 0)
	assert(amount <= _count_item(stringId));

	for i in inventory:
		if amount <= 0:
			break;
		if i.source.stringId != stringId:
			continue;

		if i.amount > amount:
			i.amount -= amount;
			amount = 0;
		else:
			amount -= i.amount;
			i = null;

#called when you want to swap to spots.
func swap_slots(oldIndex, newIndex):
	print("swapping?")
	var old = inventory[newIndex];
	inventory[newIndex] = inventory[oldIndex];
	inventory[oldIndex] = old;
		
func _count_item(stringId):
	var count = 0;
	for i in inventory:
		if i.source.stringId == stringId:
			count += i.amount;
	return count;

func _has_empty_slot():
	for i in range(inventory.size()):
		if not inventory[i]:
			return true;
	return false;
	
func _find_empty_slot():
	for i in range(inventory.size()):
		if not inventory[i]:
			return i;
	
		



