extends KinematicBody

var pause_movement = false

var horizontal_velocity = Vector2.ZERO
var velocity = Vector3.ZERO

export var acceleration = 1
export var decceleration = 0.3
export var max_speed = 5

func give_input(movement_input):
	if pause_movement: return
	
	#Add velocity based on input, slow down based on deceleration, and cap based on max speed
	horizontal_velocity += movement_input * acceleration
	horizontal_velocity = horizontal_velocity.move_toward(Vector2.ZERO, decceleration)
	horizontal_velocity = horizontal_velocity.clamped(max_speed)
	
	#Apply velocity
	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.y
	move_and_slide(velocity)
	
	pass

func get_position():
	return translation
