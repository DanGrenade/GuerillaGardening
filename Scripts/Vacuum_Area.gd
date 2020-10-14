extends Area

var current_state = PlayerGlobals.vacuum_neutral

var ObjectsInRange = []

#Call this when we switch vacuuming states
func Switch_State(new_state):
	if new_state != current_state:
		current_state = new_state
		
		for objects in ObjectsInRange:
			objects.switch_suck_state(current_state, self)
			pass
		pass
	pass

#Whenever an object enters the relevant area, add it to our pool
func _on_Vacuum_Area_area_entered(area):
	if area.has_method("switch_suck_state"):
		ObjectsInRange.push_back(area)
		area.switch_suck_state(current_state, self)
		pass
	
	pass

#When an object leaves the relevant area, remove it from the pool
func _on_Vacuum_Area_area_exited(area):
	if area.has_method("switch_suck_state") && ObjectsInRange.has(area):
		area.switch_suck_state(PlayerGlobals.vacuum_neutral, self)
		ObjectsInRange.erase(area)
		pass
	
	pass
