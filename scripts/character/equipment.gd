extends Node

var slots = [null, null, null, null, null, null, null, null]

func set_equipment(equipmentReference):
	if not equipmentReference.type == global.ITEMS.CLOTHING:
		print("Error: Attempting to assign non equipment to slot")
		return;
	
	var old = null;
	if slots[equipmentReference.slot]:
		old = unequip(equipmentReference.slot);

	slots[equipmentReference.slot] = equipmentReference;
	return old;
	
func unequip(slot):
	var oldEquipment = slots[slot];
	slots[slot] = null;
	
	return oldEquipment;
		

func get_equipment(slot):
	return slots[slot];
	
func get_equipment_text(slot):
	var text = "none";
	if slots[slot]:
		text = slots[slot].stringId
	return text

func tally_style(style_id):
	var tally = 0;
	for s in slots:
		if s:
			tally += s.style[style_id]
	return tally;
		

	
		
