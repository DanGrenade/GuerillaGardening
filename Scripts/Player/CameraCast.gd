extends RayCast

export var interaction_handler_path = NodePath()
var interaction_handler_node

func _ready():
	interaction_handler_node = get_node(interaction_handler_path)
	pass

func _input(event):
	if Input.is_action_just_pressed("hand_interact"):
		enabled = true
		
		if is_colliding():
			if get_collider().has_method("selected"):
				var return_val = get_collider().selected()
				interaction_handler_node.interact(return_val)
			pass
		pass
	pass
