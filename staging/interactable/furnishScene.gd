extends StaticBody

onready var area = get_node("Area");


func _on_Stove_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			var arr = area.get_overlapping_bodies()
			print(arr);
