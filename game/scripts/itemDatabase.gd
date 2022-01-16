extends Node

export(Array, Resource) var items

func get_item(string_id):
	for i in items:
		if i.stringId == string_id:
			return i
	return null
