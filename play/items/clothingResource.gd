extends Resource
class_name clothingResource

var aspect = global.ITEMS.EQUIPABLE;
export(global.SLOTS) var slot
export(global.COVERAGE) var covers
export(Color) var color

#each number corresponds to a stat in the stats enum.
export var style = [0, 0, 0, 0, 0, 0, 0, 0, 0]
