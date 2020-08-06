extends Node

export var visibility_distance = 50
export var visibility_angle = 40


func check_obj_visible(from_position, look_direction, object_position):
	# Check if object is close enough to see
	if from_position.distance_to(object_position) >= visibility_distance:
		return false
	
	# Check to see if anything is between these objects
	$RayCast.translation = from_position
	$RayCast.cast_to = object_position - from_position
	if $RayCast.is_colliding():
		return false
	
	# Check to see if object is within field of view
	var direction_to_object = object_position - from_position
	if rad2deg(look_direction.angle_to(direction_to_object)) > visibility_angle:
		
		return false
	
	#If all of those checks fail, we can see the object
	return true
