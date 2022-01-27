extends CenterContainer

#onready takes place once they are added to the scene tree, not
#when they are instanced. If you are getting cant find errors
#then you may be calling them out of order.
onready var charName = get_node("pAlign/hAlign/charName");
onready var charMood = get_node("pAlign/hAlign/charMood");

func set_character(cName, cMood):
	set_name(cName);
	set_mood(cMood);

func set_name(cName):
	charName.text = cName;

func set_mood(cMood):
	charMood.text = cMood;
