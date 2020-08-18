extends KinematicBody

var pause_movement = false
var velocity = Vector3.ZERO

func give_horiz_movement(horiz_movement):
	velocity.x = horiz_movement.x
	velocity.z = horiz_movement.y
	pass
	
func give_vert_movement(vert_movement):
	velocity.y = vert_movement
	pass

func _physics_process(delta):
	if pause_movement: return
	
	print(velocity)
	#Apply velocity
	move_and_slide(velocity)
	pass

func get_position():
	return translation
