extends Node

export var kinematic_body_path = NodePath()
var kinematic_body_node

func _ready():
	kinematic_body_node = get_node(kinematic_body_path)
	pass

func _process(delta):
	var vel_input = $Path_Based_Movement.get_input(kinematic_body_node.transform.origin)
	kinematic_body_node.give_input(vel_input)
	$Path_Based_Movement.check_index_change(kinematic_body_node.transform.origin)
	
	#print($Player_Visible_Checker.check_obj_visible(kinematic_body_node.transform.origin, Vector3(vel_input.x, 0, vel_input.y), PlayerGlobals.get_player_position()))
	
	pass
