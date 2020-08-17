extends Node

class InventoryItem:
	var count = 0
	var item = PlayerGlobals.item_empty
	
	func _init(_item, _count):
		item = _item
		count = _count
		pass

var item_max = 8

var Inventory = []
var max_size = 5

func Initialize(size):
	max_size = 5
	pass

func add_item(item, count):
	var index = has_item(item)
	if index != null:
		Inventory[index].count += count
		if Inventory[index].count > item_max: Inventory[index].count = item_max
		return true
	elif Inventory.size() < max_size:
		Inventory.push_back(InventoryItem.new(item, count))
		return true
	return false

func remove_item(item, count):
	var index = has_item(item)
	if index != null:
		Inventory[index].count -= count
		if Inventory[index].count <= 0:
			Inventory[index].count = 0
			Inventory[index].item = PlayerGlobals.item_empty
		pass
	pass

func has_item(item):
	for n in Inventory.size():
		if Inventory[n].item == item: return n
		else: pass
	pass
