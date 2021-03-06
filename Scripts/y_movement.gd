extends Node

export var ground_raycast_path = NodePath()
var ground_raycast_node

export var gravity = 34
export var jump_speed = 13
export var max_fall_speed = -6

export var bounce_speed = 30

var in_air = false
var current_y_velocity = 0

func _ready():
	ground_raycast_node = get_node(ground_raycast_path)
	pass

func run_gravity(delta):
	if in_air:
		if ground_raycast_node.is_colliding() && current_y_velocity < 2:
			in_air = false
			current_y_velocity = 0
		else: current_y_velocity -= (gravity * delta)
		pass
	elif !ground_raycast_node.is_colliding():
		in_air = true
		pass
	
	return current_y_velocity

func do_jump():
	if !in_air:
		in_air = true
		current_y_velocity = jump_speed
		return current_y_velocity
	return current_y_velocity

func bounce():
	in_air = true
	current_y_velocity = bounce_speed
	return current_y_velocity
