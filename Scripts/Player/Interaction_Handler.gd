extends Node

export var interact_area_path = NodePath()
var interact_area_node

enum {playerstate_normal, playerstate_interacting}
var current_state = playerstate_normal

signal change_anim_state

func _ready():
	interact_area_node = get_node(interact_area_path)
	pass

func check_interact():
	interact(interact_area_node.Interact())
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
