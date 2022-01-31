extends Node

#the word name is taken.
export var alias : String

#Use the global enum of the approiote type to get the stats.
export var style = [10, 10, 10, 10, 10, 10, 10]
export var ability = [50, 50, 50, 50, 50, 50, 50, 50, 0, 0]
export var rep = [50, 50, 50, 50]

onready var playerUI = get_node("../Canvas/playerUI")
onready var equipment =  get_node("equipment")
onready var inventory = inventoryAspect.new()
onready var physical = get_node("physical")

#mostly for debugging purposes.
func _ready():
	update_UI();
	
func update_UI():
	playerUI.updateNameTag(alias)
	
func get_style(style_id):
	return style[style_id] + equipment.tally_style(style_id);
	
func get_ability(ability_id):
	return ability[ability_id] + physical.tally_ability(ability_id);
	
func get_equipment_text(slot):
	return equipment.get_equipment_text(slot);
	
func get_equipment_array(slot):
	return equipment.get_equipment_array(slot);

func get_inventory():
	return inventory;

func get_items():
	return inventory.get_all_items()
	
func get_parts():
	return physical.get_parts();
	
func add_item(resource, amount ):
	inventory.add_item(resource.stringId, amount);
	
#used to equip an item from your inventory.
func equip_item(stringId):
	var index = inventory.find_item_index(stringId);
	var item = inventory.get_item(index);
	inventory.remove_item(stringId, 1);
	
	equipment.equip_item(item.source)
	
func unequip_item(slot):
	var old = equipment.unequip(slot)
	inventory.add_item(old.stringId, 1)
	print("Good try. " + str(old));
	
