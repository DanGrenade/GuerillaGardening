extends Node

enum {interaction_fail, interaction_grow, interaction_seeds}
var player_node

enum {item_empty, item_plant_seed}

func get_player_position():
	if player_node == null:
		return Vector3.ZERO
	else: return player_node.get_position()
