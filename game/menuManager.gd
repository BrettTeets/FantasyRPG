extends CanvasLayer

onready var player = get_node("../stageManager/playerActor")

onready var inventory = get_node("inventoryMenu")
var isInventoryUp = false
onready var equipmentMenu = get_node("equipmentMenu")
var isEquipmentMenuUp = false
onready var physicalMenu = get_node("physicalMenu")
var isPhysicalMenuUp = false
onready var socialMenu = get_node("socialMenu")
var isSocialMenuUp = false;

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("callInventory"):
		if !isInventoryUp:
			close_open_menu()
			open_inventory_menu()
		else:
			close_inventory_menu()
	if Input.is_action_just_pressed("callEquipment"):
		if !isEquipmentMenuUp:
			close_open_menu()
			open_equipment_menu()
		else:
			close_equipment_menu()
	if Input.is_action_just_pressed("callPhysical"):
		if !isPhysicalMenuUp:
			close_open_menu()
			open_physical_menu()
		else:
			close_physical_menu()
			
func toggle_social_menu():
	if !isSocialMenuUp:
		close_open_menu()
		open_social_menu()
		return socialMenu;
	else:
		close_social_menu()
#This is called so menus aren't opened ontop of each other.
func close_open_menu():
	if isInventoryUp:
		close_inventory_menu()
	if isEquipmentMenuUp:
		close_equipment_menu()
	if isPhysicalMenuUp:
		close_physical_menu()
		
func open_inventory_menu():
	inventory.pause_mode = PAUSE_MODE_PROCESS
	inventory.visible = true
	isInventoryUp = true
	inventory.set_inventory(player.get_character().get_items())

func close_inventory_menu():
	inventory.pause_mode = PAUSE_MODE_STOP
	inventory.visible = false
	isInventoryUp = false
	inventory.clear_inventory()
	
func open_equipment_menu():
	equipmentMenu.pause_mode = PAUSE_MODE_PROCESS
	equipmentMenu.visible = true
	isEquipmentMenuUp = true
	equipmentMenu.update_display(player.get_character())
	
func close_equipment_menu():
	equipmentMenu.pause_mode = PAUSE_MODE_STOP
	equipmentMenu.visible = false
	isEquipmentMenuUp = false
	equipmentMenu.clear_inventory()
	
func open_physical_menu():
	physicalMenu.pause_mode = PAUSE_MODE_PROCESS
	physicalMenu.visible = true
	isPhysicalMenuUp = true
	physicalMenu.update_display(player.get_character())
	
func close_physical_menu():
	physicalMenu.pause_mode = PAUSE_MODE_STOP
	physicalMenu.visible = false
	isPhysicalMenuUp = false
	
func open_social_menu():
	socialMenu.pause_mode = PAUSE_MODE_PROCESS
	socialMenu.visible = true
	isSocialMenuUp = true
	
func close_social_menu():
	socialMenu.pause_mode = PAUSE_MODE_STOP
	socialMenu.visible = false
	isSocialMenuUp = false
