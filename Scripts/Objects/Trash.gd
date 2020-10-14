extends KinematicBody

var vel = Vector3.ZERO

func _process(delta):
	
	vel = $SuckArea.update(global_transform.origin, vel)
	
	vel = move_and_slide(vel)
	
	pass
