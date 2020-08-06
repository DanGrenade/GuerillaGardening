extends Spatial

var yaw = 0
var pitch = 0
var sensitivity = 0.1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass

func _input(event):
	if event is InputEventMouseMotion:
		yaw = fmod(yaw - event.relative.x  * sensitivity, 360) 
		pitch = max(min(pitch - event.relative.y * sensitivity, 90),-90)
		
		rotation = Vector3(deg2rad(pitch), deg2rad(yaw), 0)
		
		pass
	pass
