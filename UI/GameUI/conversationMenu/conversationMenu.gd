extends CenterContainer


var memberBox = "res://UI/GameUI/conversationMenu/ConvoMemberBox.tscn"
var convoBox = "res://UI/GameUI/conversationMenu/ConvoBox.tscn"
onready var memberCell = get_node("back/hAlign/memberCell")
onready var convoCell = get_node("back/hAlign/sAlign/convoCell")

func add_member(character):
	var box = load(memberBox).instance();
	memberCell.add_child(box);
	box.set_member(character.charName, character.Mood);
	
func add_convo(character, text):
	var box = load(convoBox).instance();
	convoCell.add_child(box);
	box.set_text(character.charName, text);
	
