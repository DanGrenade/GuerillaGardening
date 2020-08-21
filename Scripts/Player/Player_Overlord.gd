extends Node

export var pivot_path = NodePath()
var pivot_node

func _ready():
	PlayerGlobals.player_node = get_parent()
	
	pivot_node = get_node(pivot_path)
	pass

func add_to_inventory(item, count):
	$Inventory.add_item(item, count)
	pass

func _process(delta):
	if Input.is_action_just_pressed("hand_interact") && can_interact():
		$Interaction_Handler.check_interact()
		pass
	
	#Take in horizontal movement input
	var movement_input = Vector2.ZERO
	if Input.is_action_pressed("move_forward"): movement_input.y -= 1
	if Input.is_action_pressed("move_back"): movement_input.y += 1
	if Input.is_action_pressed("move_left"): movement_input.x -= 1
	if Input.is_action_pressed("move_right"): movement_input.x += 1
	
	#Rotate based on the camera rotation
	movement_input = movement_input.rotated(-pivot_node.rotation.y)
	
	get_parent().give_horiz_movement($x_movement.give_input(movement_input, delta))
	
	get_parent().give_vert_movement($y_movement.run_gravity(delta))
	if Input.is_action_pressed("jump"):
		get_parent().give_vert_movement($y_movement.do_jump())
	
	pass

func can_interact():
	if $y_movement.in_air: return false
	
	return true

func change_pause_state(new_state):
	$x_movement.pause(new_state)
	pass

func bounce():
	get_parent().give_vert_movement($y_movement.bounce())
	pass
