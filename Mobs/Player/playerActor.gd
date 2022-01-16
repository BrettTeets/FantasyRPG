extends KinematicBody

var move_speed : float = 5.0
var jump_force : float = 12.0
var gravity : float = 29.0

var vel : Vector3 = Vector3()

onready var camera = get_node("cameraPivot")
onready var inventory = get_node("characterInventory")

func _physics_process(delta):
	vel.x = 0
	vel.z = 0
	
	var input = Vector3()
	
	if Input.is_action_pressed("moveForeward"):
		input.z += 1
	if Input.is_action_pressed("moveBackward"):
		input.z -= 1
	if Input.is_action_pressed("moveLeft"):
		input.x += 1
	if Input.is_action_pressed("moveRight"):
		input.x -= 1
	if Input.is_action_pressed("turnLeft"):
		rotation_degrees.y += 1
	if Input.is_action_pressed("turnRight"):
		rotation_degrees.y -= 1
		
	input = input.normalized()
	
	var dir = (transform.basis.z * input.z + transform.basis.x * input.x)
	
	vel.x = dir.x * move_speed
	vel.z = dir.z * move_speed
	
	vel.y -= gravity*delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y = jump_force
		
	vel = move_and_slide(vel, Vector3.UP)

func get_inventory():
	return inventory.get_items()
