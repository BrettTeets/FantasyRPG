extends Panel

#onready takes place once they are added to the scene tree, not
#whent hey are instanced. If you are getting cant find errors
#then you may be calling them out of order.
onready var slotIcon = get_node("slotIcon")
onready var slotLabel = get_node("slotLabel")
onready var slotAmount = get_node("slotAmount")

var slotIndex;
signal droppedItem(incomingIndex, localIndex)

func set_item(texture, stringId, amount):
	slotIcon.set_texture(texture)
	slotLabel.text = stringId
	slotAmount.text = str(amount)
	
func get_drag_data(_position):
	var data = {"index": slotIndex};
	var dragPreview = TextureRect.new();
	dragPreview.set_texture(slotIcon.texture);
	set_drag_preview(dragPreview);
	return data;
	
func can_drop_data(position, data):
	return data.has("index");
	
func drop_data(position, data):
	emit_signal("droppedItem", data["index"], slotIndex);
	print("dropped: " + str(data["index"]) + " " + str(slotIndex));
	
