@tool
extends Node

class_name CharacterWeaponFeature

@export var path: Node2D
@export var weapon: Weapon: 
	set(value):
		if path == null:
			printerr("Path not set")
			return
		
		for child in path.get_children():
			child.queue_free()
		
		if value == null:
			weapon = null
		else:
			path.add_child(value)
			weapon = value
			
