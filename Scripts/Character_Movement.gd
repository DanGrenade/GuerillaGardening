extends KinematicBody

var pause_movement = false
var velocity = Vector3.ZERO

signal area_interaction

func give_horiz_movement(horiz_movement):
	velocity.x = horiz_movement.x
	velocity.z = horiz_movement.y
	pass
	
func give_vert_movement(vert_movement):
	velocity.y = vert_movement
	pass

func _physics_process(delta):
	if pause_movement: return
	
	#Apply velocity
	velocity = move_and_slide(velocity)
	
	var slide_count = get_slide_count()
	pass

func get_position():
	return translation

func area_interact(interaction_type):
	emit_signal("area_interaction", interaction_type)
	pass
