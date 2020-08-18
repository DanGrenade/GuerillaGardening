extends Node

var horizontal_velocity = Vector2.ZERO

export var acceleration = 4
export var decceleration = 0.5
export var max_speed = 5

func give_input(movement_input, delta):
	#Add velocity based on input, slow down based on deceleration, and cap based on max speed
	horizontal_velocity += movement_input * acceleration * delta
	horizontal_velocity = horizontal_velocity.move_toward(Vector2.ZERO, decceleration * delta)
	horizontal_velocity = horizontal_velocity.clamped(max_speed)
	
	return horizontal_velocity
