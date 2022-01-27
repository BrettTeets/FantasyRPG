extends Panel

var localMenu;
var localCharacter;
var itemIcon 
var itemName
var itemAmount
 
func set_item(texture, stringId, slot, character, menu):
	var menuButton = get_node("MenuButton");
	var popup = menuButton.get_popup();
	popup.connect("id_pressed", self, "_on_equip_button_pressed");
	
	itemIcon = get_node("HBoxContainer/itemIcon")
	itemName = get_node("HBoxContainer/itemName")
	itemAmount = get_node("HBoxContainer/itemSlot")
	
	itemIcon.set_texture(texture)
	itemName.text = stringId
	itemAmount.text = global.SLOTS.keys()[slot]
	localCharacter = character;
	localMenu = menu;


func _on_equip_button_pressed(ID):
	print("equip button pressed.");
	localCharacter.equip_item(itemName.text);
	localMenu.update_display_auto()
