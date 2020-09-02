extends Spatial

var yaw = 0
var pitch = 0
var yaw_sensitivity = 0.1
var pitch_sensitivity = 0.05

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass

func _input(event):
	if event is InputEventMouseMotion:
		yaw = fmod(yaw - event.relative.x  * yaw_sensitivity, 360) 
		pitch = max(min(pitch - event.relative.y * pitch_sensitivity, -10),-60)
		
		rotation.y = deg2rad(yaw)
		$Camera_Pivot_Pitch.rotation.x = deg2rad(pitch)
		
		pass
	pass
