extends Area

export var interaction_type = PlayerGlobals.interaction_bounce



func _on_Area_body_entered(body):
	print("Hit")
	if body.has_method("area_interact"):
		body.area_interact(interaction_type)
	pass 
