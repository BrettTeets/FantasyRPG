extends CenterContainer

#this is what you add into the container. This should be updated to hold the reference directly.
export var inventoryControl = "string"
onready var container = get_node("backing/vAlign/hAlign/sAlign/itemList")
onready var displayStats = get_node("backing/vAlign/hAlign/currentStats")
onready var displayEquipped = get_node("backing/vAlign/hAlign/equiped")

var localCharacter;
#used to update the display when equipment changes or the window is opened.
func update_display(character):
	clear_inventory()
	localCharacter = character;
	set_inventory(character.get_items(), character)
	displayStats.set_stats(character);
	displayEquipped.display_equipment(character);
	
func update_display_auto():
	clear_inventory()
	set_inventory(localCharacter.get_items(), localCharacter)
	displayStats.set_stats(localCharacter);
	displayEquipped.display_equipment(localCharacter);
	
func set_inventory(items, character):
	for i in items:
		if i.source.has_aspect(global.ITEMS.EQUIPABLE):
			var n = load(inventoryControl).instance()
			var slot = i.source.get_aspect(global.ITEMS.EQUIPABLE).slot
			n.set_item(i.source.texture, i.source.stringId , slot, character, self)
			container.add_child(n)

func clear_inventory():
	for n in container.get_children():
		container.remove_child(n)
		


	

	
