extends KinematicBody

onready var enemyStats = get_node("EnemyStats")


func _on_genericEnemy_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed == true:
			enemyStats.adjustHealth(10)
			enemyStats.updateHealthBar()
			
