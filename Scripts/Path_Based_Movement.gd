extends Node

export var path_node_path = NodePath()
var curve

export var index_change_distance = 1
var current_index = 0

func _ready():
	curve = get_node(path_node_path).curve
	pass

func get_input(body_position):
	var input_dir = curve.get_point_position(current_index) - body_position
	return Vector2(input_dir.x, input_dir.z)

func check_index_change(body_position):
	var body_pos2 = Vector2(body_position.x, body_position.z)
	var curve_pos2 = Vector2(curve.get_point_position(current_index).x, curve.get_point_position(current_index).z)
	
	if body_pos2.distance_squared_to(curve_pos2) < index_change_distance:
		if current_index + 1 >= curve.get_point_count(): current_index = 0
		else: current_index += 1
		
		return true
	
	return false
