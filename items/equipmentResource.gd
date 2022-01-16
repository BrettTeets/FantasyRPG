extends "res://items/itemResource.gd"
class_name equipmentResource

export(Constants.equipmentSlot) var slot;
export var slotName = ""

#each number corresponds to a stat in the stats enum.
export var stats = [0, 0, 0, 0, 0, 0, 0]

