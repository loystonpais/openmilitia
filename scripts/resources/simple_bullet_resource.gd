@tool
extends Resource

class_name SimpleBulletResource

@export var speed: float = 2000
@export var max_range: float = 10
@export var damage_points_on_hit: float = 10
@export var texture: CompressedTexture2D:
	set(value):
		texture = value
		emit_changed()
	get:
		return texture
@export var collision_shape: Shape2D:
	set(value):
		collision_shape = value
		emit_changed()
	get:
		return collision_shape
@export var collision_shape_position: Vector2:
	set(value):
		collision_shape_position = value
		emit_changed()
	get:
		return collision_shape_position
	
