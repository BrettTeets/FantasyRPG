extends VBoxContainer

onready var head = get_node("head")
onready var face = get_node("face")
onready var torso = get_node("torso")
onready var chest = get_node("chest")
onready var legs = get_node("legs")
onready var waist = get_node("waist")
onready var feet = get_node("feet")
onready var ankles = get_node("ankles")

func display_equipment(character):
	head.text = "Head: " + character.get_equipment_text(Constants.equipmentSlot.HEAD)
	face.text = "Face: " + character.get_equipment_text(Constants.equipmentSlot.FACE)
	torso.text = "Torso: " + character.get_equipment_text(Constants.equipmentSlot.TORSO)
	chest.text = "Chest: " + character.get_equipment_text(Constants.equipmentSlot.CHEST)
	legs.text = "Legs: " + character.get_equipment_text(Constants.equipmentSlot.LEGS)
	waist.text = "Waist: " + character.get_equipment_text(Constants.equipmentSlot.WAIST)
	feet.text = "Feet: " + character.get_equipment_text(Constants.equipmentSlot.FEET)
	ankles.text = "Ankles: " + character.get_equipment_text(Constants.equipmentSlot.ANKLE)
	
