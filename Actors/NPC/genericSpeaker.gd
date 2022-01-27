extends KinematicBody

onready var enemyStats = get_node("NPCStats")
var speaking = false

onready var nameTag = get_node("npcNameTag3D")
onready var healthBar = get_node("npcHealthBar3D")
onready var character = get_node("simpleCharacter")

func _ready():
	nameTag.updateNameTag(character.characterName)
	healthBar.updateHealthBar(character.hp, character.maxHp)
	
func updateHealthBar():
	healthBar.updateHealthBar(character.hp, character.maxHp)
			





func _on_genericEnemy_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed == true:
			if speaking == false:
				speaking = true;
				var n = get_node("/root/gameManager/SocialManager");
				
				n.start_dialog(character);
				
				
		

	

