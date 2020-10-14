extends Node

var current_state = PlayerGlobals.vacuum_neutral
var target_node

export var accel = 1
export var max_speed = 12

func switch_suck_state(new_state, node):
	current_state = new_state
	target_node = node
	
	pass

func update(current_pos, _velocity):
	match current_state:
		PlayerGlobals.vacuum_neutral:
			_velocity = _velocity.move_toward(Vector3.ZERO, accel)
			pass
		PlayerGlobals.vacuum_push:
			var direction = current_pos - target_node.global_transform.origin
			_velocity += MoveInDirection(direction)
			pass
		PlayerGlobals.vacuum_pull:
			var direction = target_node.global_transform.origin - current_pos
			_velocity += MoveInDirection(direction)
			pass
	
	if _velocity.length() > max_speed:
		_velocity = _velocity.normalized() * max_speed
		pass
	
	return _velocity

func MoveInDirection(velocity):
	velocity.y = 0
	velocity.normalized()
	return velocity * accel
