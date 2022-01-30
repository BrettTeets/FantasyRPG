extends HBoxContainer

signal doff_presssed;

onready var label = get_node("column/text");
var ribbonSlot;
var equipPanel = "res://UI/GameUI/equipmentMenu/equipPanel.tscn"


func init_ribbon(text, slot):
	label.text = text;
	ribbonSlot = slot;
	
func add_panel(texture, string_id):
	var panel = load(equipPanel).instance()
	add_child(panel);
	panel.set_item(texture, string_id);
	
func remove_panel():
	var count = get_child_count();
	if count > 1:
		get_child(count - 1).free();
		
func clear():
	for i in get_child_count():
		remove_panel();
		
func get_button():
	return get_node("column/doffButton");
	

func _on_doffButton_pressed():
	emit_signal("doff_presssed", ribbonSlot);
	remove_panel();
