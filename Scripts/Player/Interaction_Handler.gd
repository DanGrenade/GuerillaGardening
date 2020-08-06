extends Node

enum {playerstate_normal, playerstate_interacting}
var current_state = playerstate_normal

export var movement_node_path = NodePath()
var movement_node

signal change_anim_state

func _ready():
	movement_node = get_node(movement_node_path)
	pass

func interact(interaction_type):
	if interaction_type == PlayerGlobals.interaction_grow:
		$PlantingTime.start()
		emit_signal("change_anim_state", "Planting")
		current_state = playerstate_interacting
		movement_node.pause_movement = true
		pass
	pass


func _on_PlantingTime_timeout():
	if current_state == playerstate_interacting:
		emit_signal("change_anim_state", "Idle")
		current_state = playerstate_normal
		movement_node.pause_movement = false
		pass
	pass 
