extends CenterContainer

#onready takes place once they are added to the scene tree, not
#when they are instanced. If you are getting cant find errors
#then you may be calling them out of order.
onready var charName = get_node("pAlign/vAlign/charName");
onready var textBox = get_node("pAlign/vAlign/hAlign/textBox");

func set_dialog(cName, text):
	set_name(cName);
	set_text(text);
	
func set_name(cName):
	charName.text = cName;

func set_text(text):
	textBox.text = text;
