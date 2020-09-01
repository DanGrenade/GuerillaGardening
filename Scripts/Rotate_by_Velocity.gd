extends Node

export var Rotation_Node_Path = NodePath()
var Rotation_Node

func _ready():
	Rotation_Node = get_node(Rotation_Node_Path)
	pass

func Give_Velocity(velocity):
	Rotation_Node.rotation.y = -Vector2(velocity.x, velocity.z).angle()
	
	pass
