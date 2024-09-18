@tool
extends Area2D

class_name SimpleBullet

@export var resource: SimpleBulletResource:
	set(value):
		resource = value
		if resource != null:
			resource.connect("changed", _update)
			_update()
		
var sprite := Sprite2D.new()
var collision_shape := CollisionShape2D.new()
var direction: Vector2
var _distance_travelled: float = 0

func _update() -> void:
	sprite.texture = resource.texture
	collision_shape.shape = resource.collision_shape
	collision_shape.position = resource.collision_shape_position
	print(collision_shape.position)

func _physics_process(delta: float) -> void:
	var distance: float = resource.speed * delta
	var motion: Vector2 = direction * resource.speed * delta 
	
	position += motion
	
	_distance_travelled += distance
	if _distance_travelled > resource.max_range:
		queue_free()

func on_bullet_touches_body(body: Node2D) -> void:
	if body is SimpleBullet:
		return
	queue_free()
	
func _ready() -> void:
	
	add_child(sprite)
	add_child(collision_shape)
