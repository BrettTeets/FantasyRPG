extends Panel

func set_item(texture, stringId, slotName):
	var itemIcon = get_node("HBoxContainer/itemIcon")
	var itemName = get_node("HBoxContainer/itemName")
	var itemAmount = get_node("HBoxContainer/itemSlot")
	itemIcon.set_texture(texture)
	itemName.text = stringId
	itemAmount.text = slotName
