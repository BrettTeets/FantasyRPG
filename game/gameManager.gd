extends Node

onready var inventory = get_node("CanvasLayer/playerInventoryMenu")
var isInventoryUp = false
onready var equipmentMenu = get_node("CanvasLayer/playerEquipmentMenu")
var isEquipmentMenuUp = false

onready var player = get_node("stageManager/playerActor")


func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("callInventory"):
		print("inventory")
		if !isInventoryUp:
			open_inventory_menu()
		else:
			close_inventory_menu()
	if Input.is_action_just_pressed("callEquipment"):
		print("equipment")
		if !isEquipmentMenuUp:
			open_equipment_menu()
		else:
			close_equipment_menu()
		
func open_inventory_menu():
	inventory.pause_mode = PAUSE_MODE_PROCESS
	inventory.visible = true
	isInventoryUp = true
	inventory.set_inventory(player.get_inventory())

func close_inventory_menu():
	inventory.pause_mode = PAUSE_MODE_STOP
	inventory.visible = false
	isInventoryUp = false
	inventory.clear_inventory()
	
func open_equipment_menu():
	equipmentMenu.pause_mode = PAUSE_MODE_PROCESS
	equipmentMenu.visible = true
	isEquipmentMenuUp = true
	equipmentMenu.set_inventory(player.get_inventory())
	equipmentMenu.set_stats(11)
	
func close_equipment_menu():
	equipmentMenu.pause_mode = PAUSE_MODE_STOP
	equipmentMenu.visible = false
	isEquipmentMenuUp = false
	equipmentMenu.clear_inventory()
