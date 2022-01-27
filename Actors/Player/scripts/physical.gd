extends Node

export var stringId : String
export var defaultCovering = "Skin" #this should be a resource one day.
export var defaultColor : Color
export var defaultSpecies : String

var partList = Array()

func _ready():
	populate_part_list();
	for p in partList:
		print(p.stringId);

func populate_part_list():
	partList.clear();
	
	partList = get_children()

func tally_ability(ability_id):
	var tally = 0;
	for p in partList:
		tally += p.ability[ability_id]
	if ability_id > 7:
		tally = tally / get_child_count();
	return tally;
	
func get_parts():
	return partList;
