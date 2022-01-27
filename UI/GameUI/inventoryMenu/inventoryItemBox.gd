extends Panel

#onready takes place once they are added to the scene tree, not
#whent hey are instanced. If you are getting cant find errors
#then you may be calling them out of order.
onready var itemIcon = get_node("HBoxContainer/itemIcon")
onready var itemName = get_node("HBoxContainer/itemName")
onready var itemAmount = get_node("HBoxContainer/itemAmount")

func set_item(texture, stringId, amount):
	itemIcon.set_texture(texture)
	itemName.text = stringId
	itemAmount.text = str(amount)


