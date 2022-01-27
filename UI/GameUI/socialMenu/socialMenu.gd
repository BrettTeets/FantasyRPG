extends Control

#onready takes place once they are added to the scene tree, not
#when they are instanced. If you are getting cant find errors
#then you may be calling them out of order.
onready var charCells = get_node("background/vAlign/charCells");
onready var dialogCells = get_node("background/vAlign/sAlign/dialogCell");
var dialogBox = "res://UI/GameUI/socialMenu/speachBox.tscn";
var charBox = "res://UI/GameUI/socialMenu/charBox.tscn";

func add_character(characterName, characterMood):
	var n = load(charBox).instance()
	charCells.add_child(n);
	n.set_character(characterName, characterMood);
	
func add_dialog(characterName, characterText):
	var n = load(dialogBox).instance();
	dialogCells.add_child(n);
	n.set_dialog(characterName, characterText);
	
func get_button():
	return get_node("background/vAlign/HBoxContainer/Button");
