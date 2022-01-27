extends Spatial

export var look_sensativity : float = 2.0
export var min_angle : float = -20.0
export var max_angle : float = 75.0

var mouse_delta : Vector2 = Vector2()

onready var player = get_parent()

func _input(event):
	if Input.is_action_pressed("lookMode"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		if event is InputEventMouseMotion:
			mouse_delta = event.relative
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
func _process(delta):
	var rot = Vector3(mouse_delta.y, mouse_delta.x, 0) * look_sensativity
	
	rotation_degrees.x += rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, min_angle, max_angle)
	
	player.rotation_degrees.y -= rot.y
	
	mouse_delta = Vector2()
