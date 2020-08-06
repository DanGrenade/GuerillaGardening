extends Node

enum {interaction_fail, interaction_grow}
var player_node

func get_player_position():
	if player_node == null:
		return Vector3.ZERO
	else: return player_node.get_position()
