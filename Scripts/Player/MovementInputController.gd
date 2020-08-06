extends Node

export var input_path = NodePath()
var input_node

export var pivot_path = NodePath()
var pivot_node

func _ready():
	input_node = get_node(input_path)
	pivot_node = get_node(pivot_path)
	pass

func _process(delta):
	#Take in horizontal movement input
	var movement_input = Vector2.ZERO
	if Input.is_action_pressed("move_forward"): movement_input.y -= 1
	if Input.is_action_pressed("move_back"): movement_input.y += 1
	if Input.is_action_pressed("move_left"): movement_input.x -= 1
	if Input.is_action_pressed("move_right"): movement_input.x += 1
	
	#Rotate based on the camera rotation
	movement_input = movement_input.rotated(-pivot_node.rotation.y)
	
	input_node.give_input(movement_input)
	pass
