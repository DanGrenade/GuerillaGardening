extends Node

var plant_animations = {}

func _init():
	
	plant_animations[GameState.plant_empty] = plant_anim_data.new({0: "NoPlant"})
	plant_animations[GameState.plant_sunflower] = plant_anim_data.new({0: "Plant_Grow", 1: "Sunflower_Grow_2"})
	
	pass

class plant_anim_data:
	
	#The lowest range number for the animation, following by the string of the animation
	var animation_cutoff = {}
	
	func _init(cutoff_dict):
		animation_cutoff = cutoff_dict
		pass
	
	#Pass day count in, get animation string out
	func CheckForAnimation(day_count):
		
		var animation_string = ""
		for n in range(day_count + 1):
			if animation_cutoff.has(n):
				animation_string = animation_cutoff[n]
				pass
			pass
		return animation_string
	
