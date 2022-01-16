extends Panel


func set_item(texture, stringId, amount):
	var itemIcon = get_node("HBoxContainer/itemIcon")
	var itemName = get_node("HBoxContainer/itemName")
	var itemAmount = get_node("HBoxContainer/itemAmount")
	itemIcon.set_texture(texture)
	itemName.text = stringId
	itemAmount.text = str(amount)


