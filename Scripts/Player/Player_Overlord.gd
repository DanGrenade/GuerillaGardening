extends Node

func _ready():
	PlayerGlobals.player_node = get_parent()
	pass

func add_to_inventory(item, count):
	$Inventory.add_item(item, count)
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_I):
		print($Inventory.has_item(PlayerGlobals.item_plant_seed))
		pass
	pass
