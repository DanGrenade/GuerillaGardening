extends Node

export var camera_cast_path = NodePath()
var camera_cast_node

enum {playerstate_normal, playerstate_interacting}
var current_state = playerstate_normal

signal change_anim_state

func _ready():
	camera_cast_node = get_node(camera_cast_path)
	pass

func check_interact():
	var collider = camera_cast_node.get_collider()
	if collider != null && collider.has_method("selected"):
		var return_val = collider.selected()
		interact(return_val)
		pass
	pass

func interact(interaction_type):
	match interaction_type:
		PlayerGlobals.interaction_grow:
			$PlantingTime.start()
			emit_signal("change_anim_state", "Planting")
			current_state = playerstate_interacting
			get_parent().change_pause_state(true)
			pass
		PlayerGlobals.interaction_seeds:
			get_parent().add_to_inventory(PlayerGlobals.item_plant_seed, 999)
			pass
		PlayerGlobals.interaction_bounce:
			get_parent().bounce()
			pass
	pass


func _on_PlantingTime_timeout():
	if current_state == playerstate_interacting:
		emit_signal("change_anim_state", "Idle")
		current_state = playerstate_normal
		get_parent().change_pause_state(false)
		pass
	pass 
