@tool
extends Node2D

class_name Weapon

@export var projectile_spawn_path: Node
@export var collision_shapes: Array[Shape2D]



func _get_property_list() -> Array[Dictionary]:
	return [
		{
			"name": "testing",
			"type": TYPE_STRING,
			"usage": PROPERTY_USAGE_DEFAULT
		}
	]

	
