extends Node

export(Array, Resource) var stages
var currentStage
onready var player = get_node("playerActor")

func _ready():
	load_stage(0, 0)
	
	
func load_stage(stage_id, gate_id):
	#just a intermediary.
	var stageInfo = stages[stage_id]
	
	if currentStage:
		print("Clearing A Stage")
		currentStage.queue_free()
	
	#load the stage itself from its path and add it to the manager. also save a reference to it.
	var stage = load(stageInfo.stagePath).instance()
	add_child(stage)
	currentStage = stage
	
	#now move the player to the appopriate gate.
	player.transform.origin = stageInfo.Gates[gate_id]
