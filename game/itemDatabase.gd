extends Node

var items = Array()

func _ready():
	var directory = Directory.new();
	directory.open("res://play/items/resources/");
	directory.list_dir_begin();
	
	var filename = directory.get_next();
	while(filename):
		if not directory.current_is_dir():
			items.append(load("res://play/items/resources/%s" % filename));
		filename = directory.get_next();

func get_item(string_id):
	for i in items:
		if i.stringId == string_id:
			return i
	print("Failed to get item: " + string_id + " in item database.")
	return null
