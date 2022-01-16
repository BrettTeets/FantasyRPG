extends Node

var headSlot
var torsoSlot
var legSlot
var footSlot

func set_torso(equipmentReference):
	torsoSlot = equipmentReference
	
func get_torso():
	return torsoSlot
	
func tally_defense():
	var def = 0;
	if torsoSlot:
		def += torsoSlot.defense;
	return def;
