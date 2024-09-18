@tool
extends WeaponResource

class_name SimpleGunResource

@export_group("Simple gun resource")
@export var texture: CompressedTexture2D:
	set(value):
		texture = value
		emit_changed()
	get:
		return texture
@export var bullet: SimpleBulletResource
@export var hold_position: Vector2:
	set(value):
		hold_position = value
		emit_changed()
	get:
		return hold_position
@export var collision_shapes: Array[Shape2D]
@export var bullet_audio: AudioStream
@export_range(0, 1) var accuracy: float
@export var bullet_cooldown_time: float
