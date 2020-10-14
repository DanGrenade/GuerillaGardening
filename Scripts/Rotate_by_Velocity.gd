extends Node

export var Rotation_Node_Path = NodePath()

export var rotation_deadzone = 0.07

var Rotation_Node

func _ready():
	Rotation_Node = get_node(Rotation_Node_Path)
	pass

func Give_Velocity(velocity):
	
	if Vector2(velocity.x, velocity.z).length_squared() >= rotation_deadzone:
		Rotation_Node.rotation.y = -Vector2(velocity.x, velocity.z).angle()
	pass
