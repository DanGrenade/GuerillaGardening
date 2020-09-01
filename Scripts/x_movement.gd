extends Node

var horizontal_velocity = Vector2.ZERO

var pause_state = false

export var acceleration = 35
export var decceleration = 20
export var max_speed = 8

func give_input(movement_input, delta):
	
	if !pause_state:
		#Add velocity based on input, slow down based on deceleration, and cap based on max speed
		horizontal_velocity += movement_input * acceleration * delta
		horizontal_velocity = horizontal_velocity.move_toward(Vector2.ZERO, decceleration * delta)
		horizontal_velocity = horizontal_velocity.clamped(max_speed)
		pass
	
	return horizontal_velocity

func pause(state):
	pause_state = state
	if pause_state: horizontal_velocity = Vector2.ZERO
	pass
