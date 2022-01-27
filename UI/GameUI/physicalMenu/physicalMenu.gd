extends CenterContainer

export var partBox = "res://UI/GameUI/physicalMenu/physicalPartBox.tscn"
onready var displayParts = get_node("back/vAlign/hAlign/parts")
onready var displayAttributes = get_node("back/vAlign/hAlign/stats")

func update_display(character):
	displayAttributes.set_attributes(character);
	clear_part_display()
	update_part_display(character)

func update_part_display(character):
	for p in character.get_parts():
		var n = load(partBox).instance()
		n.set_part(p.stringId, p.species)
		displayParts.add_child(n)

func clear_part_display():
	for n in displayParts.get_children():
		displayParts.remove_child(n)
