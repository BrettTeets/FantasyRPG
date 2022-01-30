extends Node

var all_equipment = [[], [], [], [], [], []]

#this was returning old whose calling it? They are expecting an old item.
func equip_item(resource):
	if not resource.has_aspect(global.ITEMS.EQUIPABLE):
		print("Error: Attempting to equip unequibable item")
		return;
	
	var itemAspect = resource.get_aspect(global.ITEMS.EQUIPABLE);
	
	#add it to the back of the internal array.
	all_equipment[itemAspect.slot].push_back(resource);

func unequip(slot):
	var oldEquipment = all_equipment[slot].pop_back();
	return oldEquipment;
		

#returns an array of all the equipment in that slot.
func get_equipment_array(slot):
	return all_equipment[slot];

#now it returns an array it use to return a single line.
func get_equipment_text(slot):
	var text = [];
	var equipment_slot = all_equipment[slot];
	for e in equipment_slot:
		text.push_back(e.stringId)
	if text.size() == 0:
		text.push_back("none");
	return text

func tally_style(style_id):
	var tally = 0;
	for a in all_equipment:
		for i in range(a.size(), 0, -1):

			tally += a[i-1].get_aspect(global.ITEMS.EQUIPABLE).style[style_id]
	return tally;
		

	
		
