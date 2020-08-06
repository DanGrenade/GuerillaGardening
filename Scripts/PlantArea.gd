extends Area


enum {state_unplanted, state_seed, state_grown}
var current_state = state_unplanted

func selected():
	if current_state == state_unplanted:
		current_state = state_seed
		$CSGCylinder/AnimationPlayer.play("Plant_Grow")
		return PlayerGlobals.interaction_grow
	return PlayerGlobals.interaction_fail
