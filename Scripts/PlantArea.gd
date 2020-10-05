extends Area

export var default_plant = 0
export var default_growth_time = 0

func _ready():
	#This will store the save data of the default plant, or get us more current data for this location
	var current_state = GameState.Initialize_plant(get_path(), GameState.plant_data.new(default_plant, default_growth_time))
	
	visuals_update(current_state)
	
	pass

func selected():
	if GameState.plants[get_path()].plant_type == GameState.plant_empty:
		GameState.Update_Plant(get_path(), GameState.plant_data.new(GameState.plant_sunflower, 0))
		data_update()
		pass
	pass

func data_update():
	var current_state = GameState.plants[get_path()]
	visuals_update(current_state)
	pass

func visuals_update(var current_state):
	var anim = PlantGlobals.plant_animations[current_state.plant_type].CheckForAnimation(current_state.plant_growth_time)
	
	$CSGCylinder/AnimationPlayer.play(anim)
	
	pass
