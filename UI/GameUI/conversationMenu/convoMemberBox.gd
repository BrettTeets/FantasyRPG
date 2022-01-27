extends Panel

#onready takes place once they are added to the scene tree, not
#when they are instanced. If you are getting cant find errors
#then you may be calling them out of order.
onready var charName = get_node("hAlign/charName");
onready var charMood = get_node("hAlign/charMood");

func set_member(cName, mood):
	charName.text = cName;
	charMood.text = mood;

