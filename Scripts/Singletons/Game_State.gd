extends Node

enum {plant_empty, plant_sunflower}

var Current_Day = 0

#Where plant data is stored. The Key is the location of the plant
#the value is the save data for the plant goes
var plants = {}

func Increment_Day():
	Current_Day += 1
	
	#Increment the day counters of our plant friends
	for val in plants.values():
		val.plant_growth_time += 1
		pass
		
	#Update any plants that are currently active
	for key in plants.keys():
		if get_node(key) != null && get_node(key).has_method("data_update"):
			get_node(key).data_update()
			pass
		pass
	pass

#Plant checks for existing data, or passes default data to store if necessary.
func Initialize_plant(location, plant_data):
	if !plants.has(location):
		plants[location] = plant_data
		pass
	
	return plants[location]
	

func Update_Plant(location, plant_data):
	plants[location] = plant_data
	return plants[location]

#Individual plant data that needs to be saved goes here
class plant_data:
	
	var plant_type
	var plant_growth_time
	
	func _init(type, growth_amount):
		plant_type = type
		plant_growth_time = growth_amount
		pass
	
