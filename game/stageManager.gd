extends Node


#should rename this stageDatabase at some point.

var stagePaths = Array()
var currentStage
onready var player = get_node("playerActor")


func _ready():
	var directory = Directory.new();
	directory.open("res://staging/stages/");
	directory.list_dir_begin();
	
	var filename = directory.get_next();
	while(filename):
		if not directory.current_is_dir():
			stagePaths.append("res://staging/stages/%s" % filename)
		filename = directory.get_next();
	
	load_stage(0, 0)
	
	
func load_stage(stage_id, gate_id):
	#just a intermediary.
	var loadedStage = load(stagePaths[stage_id])
	
	if currentStage:
		print("Clearing A Stage")
		currentStage.queue_free()

	#load the stage itself from its path and add it to the manager. also save a reference to it.
	var stage = loadedStage.instance()
	add_child(stage)
	currentStage = stage
	
	#now move the player to the appopriate gate.
	player.transform.origin = stage.Gates[gate_id]
