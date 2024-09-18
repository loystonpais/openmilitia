@tool

extends CharacterBody2D

class_name HumanoidPlayer

signal weapon_detected(weapon_data: WeaponResource)
signal weapon_undetected(weapon_data: WeaponResource)


@export_group("")
@export var animation: AnimationPlayer
@export var character: HumanoidCharacterFeatured
@export var listen_to_input_actions: bool = false


@export var SPEED: int = 300.0
const JUMP_VELOCITY = -400.0


func handle_input() -> void:
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		character.facing = direction
		if direction == -1:
			walk_left()
		else:
			walk_right()
	else:
		animation.play("RESET")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("shoot"):
		if character.right_hand_weapon_feature.weapon is SimpleGun:
			character.right_hand_weapon_feature.weapon.shoot()
	

func _physics_process(delta: float) -> void:
	
	if Engine.is_editor_hint():
		return
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if listen_to_input_actions:
		handle_input()
		
	move_and_slide()

func walk_left() -> void:
	character.scale.x = -1
	animation.play("walk")
	velocity.x = -1 * SPEED

func walk_right() -> void:
	character.scale.x = 1
	animation.play("walk")
	velocity.x = 1 * SPEED
	
func stop() -> void:
	animation.play("RESET")
	velocity.x = move_toward(velocity.x, 0, SPEED)


func _on_interaction_area_area_entered(area: Area2D) -> void:
	if area is WeaponArea:
		weapon_detected.emit(area.weapon_data)


func attach_weapon(weapon: Weapon) -> void:
	character.right_hand_weapon_feature.weapon = weapon
	
func detach_weapon() -> Weapon:
	return 
