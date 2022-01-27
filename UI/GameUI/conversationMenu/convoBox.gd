extends PanelContainer

#onready takes place once they are added to the scene tree, not
#when they are instanced. If you are getting cant find errors
#then you may be calling them out of order.
onready var charName = get_node("vAlign/charName")
onready var infoText = get_node("vAlign/hAlign/convo")

func set_text(cName, text):
	charName = cName;
	infoText.text = text;
