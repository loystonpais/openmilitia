@tool
extends Node


@export var world: Node2D

func put_weapon_in_world(weapon: Weapon, position: Vector2) -> void:
	var rigid_weapon := RigidBody2D.new()
	weapon.reparent(rigid_weapon, true)
	for shape: Shape2D in weapon.collision_shapes:
		
		pass
		#shape.reparent(rigid_weapon, false)
	
	world.add_child(rigid_weapon)
	rigid_weapon.global_position = Vector2.ZERO

func _ready() -> void:
	
	var weapon: Weapon = load("res://scenes/guns/ak48/ak48.tscn").instantiate()
	weapon.projectile_spawn_path = world
	
	print(weapon)
	
	$Player.attach_weapon(weapon)
	
	if Engine.is_editor_hint():
		return
	
	#put_weapon_in_world(weapon, $Player.global_position)
	
	
	return
