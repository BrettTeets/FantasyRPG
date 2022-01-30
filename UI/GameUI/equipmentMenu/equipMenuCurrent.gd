extends VBoxContainer

#var accessory = get_node("accessory")
onready var head = get_node("headRibbon")
onready var torso = get_node("torsoRibbon")
onready var legs = get_node("legsRibbon")
onready var feet = get_node("feetRibbon")
onready var hands = get_node("handsRibbon")

func _ready():
	head.init_ribbon("Head", global.SLOTS.HEAD);
	torso.init_ribbon("Torso", global.SLOTS.TORSO);
	legs.init_ribbon("Legs", global.SLOTS.LEGS);
	feet.init_ribbon("Feet", global.SLOTS.FEET);
	hands.init_ribbon("Hands", global.SLOTS.HANDS);

func display_equipment(character):
	clear_display(character)
	update_ribbon(head, global.SLOTS.HEAD, character);
	head.connect("doff_presssed", character, "unequip_item")
	update_ribbon(torso, global.SLOTS.TORSO, character);
	torso.connect("doff_presssed", character, "unequip_item")
	update_ribbon(legs, global.SLOTS.LEGS, character);
	legs.connect("doff_presssed", character, "unequip_item")
	update_ribbon(feet, global.SLOTS.FEET, character);
	feet.connect("doff_presssed", character, "unequip_item")
	update_ribbon(hands, global.SLOTS.HANDS, character);
	hands.connect("doff_presssed", character, "unequip_item")

func update_ribbon(ribbon, slot, character):
	var item_array = character.get_equipment_array(slot);
	for i in item_array:
		ribbon.add_panel(i.texture, i.stringId);
		
func clear_display(character):
	head.clear()
	head.disconnect("doff_presssed", character, "unequip_item")
	torso.clear();
	torso.disconnect("doff_presssed", character, "unequip_item")
	legs.clear();
	legs.disconnect("doff_presssed", character, "unequip_item")
	feet.clear();
	feet.disconnect("doff_presssed", character, "unequip_item")
	hands.clear();
	hands.disconnect("doff_presssed", character, "unequip_item")
