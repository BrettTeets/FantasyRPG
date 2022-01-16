extends Node

var headSlot #hat
var faceSlot #mask
var torsoSlot #shirt
var chestSlot #bra
var legSlot #pants
var waistSlot #underwear
var footSlot #shoes
var ankleSlot #socks

var slots = [null, null, null, null, null, null, null, null]

func set_equipment(equipmentReference):
	if not equipmentReference.type == Constants.itemType.EQUIPMENT:
		print("Error: Attempting to assign non equipment to slot")
		return false;

	slots[equipmentReference.slot] = equipmentReference;
	return true;
	

func get_equipment(slot):
	return slots[slot];

func tally_stat(statType):
	var tally = 0;
	for s in slots:
		tally += s.stats[statType]
	return tally;
		

	
		