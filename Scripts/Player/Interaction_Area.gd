extends Area

func Interact():
	for area in get_overlapping_areas():
		if area.has_method("selected"):
			var return_val = area.selected()
			return return_val
		pass
	pass
