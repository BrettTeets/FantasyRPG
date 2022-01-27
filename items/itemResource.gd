extends Resource
class_name itemResource

export var stringId : String
export var itemDesc : String

export var stackable : bool = false
export var stackSize : int = 1

export var texture : Texture
export var mesh : Mesh

export var weight : float
export var value : int

export(Array, Resource) var aspects

func has_aspect(itemType):
	for a in aspects:
		if a.type == itemType:
			return true;
	return false;
	
func get_aspect(itemType):
	for a in aspects:
		if a.type == itemType:
			return a;
	return false;
	



#IsFlame
#EquipCost

