extends Area

export(Resource) var source;
export var amount : int ;

func _ready():
	if source:
		if source.mesh:
			get_node("MeshInstance").mesh = source.mesh;


func _on_itemScene_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			print("clicked");

func _on_itemScene_body_entered(body):
	if body is playerActor:
		body.get_character().add_item(source, amount);
		self.queue_free();


