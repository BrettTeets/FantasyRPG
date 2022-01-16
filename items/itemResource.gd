extends Resource
class_name itemResource

export var stringId : String
export var stackable : bool = false
export var stackSize : int = 1

export(Constants.itemType) var type;
export var texture : Texture
export var mesh : Mesh

#IsFlame
#EquipCost

