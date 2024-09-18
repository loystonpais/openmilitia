@tool
extends Node2D

class_name HumanoidCharacter

@export_group("Controls")
@export_enum("Left:-1", "Right:1") var facing: int = 1: 
	set(value):
		facing = value
		scale.x = value
	get:
		return facing

@export_range(-1, 1) var head_rotation: float = -0.469:
	set(value):
		head_rotation = value
		# because lerp takes values from 0 to 1 
		if head_ik != null:
			head_ik.position.x = lerp(-118, 400, (value + 1) / 2)
	get:
		return head_rotation

@export_range(-1, 1) var hand_right_rotation: float = -0.262:
	set(value):
		hand_right_rotation = value
		if hand_left_ik != null:
			hand_right_ik.position.x = lerp(-400, 800, (value + 1) / 2)
	get:
		return hand_right_rotation
		
@export_range(-1, 1) var hand_left_rotation: float = 0.398:
	set(value):
		hand_left_rotation = value
		if hand_left_ik != null:
			hand_left_ik.position.x = lerp(-400, 400, (value + 1) / 2)
	get:
		return hand_left_rotation


@export_group("Resources")
@export var skin: HumanoidCharacterSkin: 
	set(value):
		skin = value
		
		if head_sprite == null:
			return
		
		head_sprite.texture = skin.head
		eye_left_sprite.texture = skin.eye_left
		eye_right_sprite.texture = skin.eye_right
		pupil_left_sprite.texture = skin.pupil_left
		pupil_right_sprite.texture = skin.pupil_right
		eyebrow_left_sprite.texture = skin.eyebrow_left
		eyebrow_right_sprite.texture = skin.eyebrow_right
		mouth_sprite.texture = skin.mouth
		body_sprite.texture = skin.body
		hand_left_sprite.texture = skin.hand_left
		hand_right_sprite.texture = skin.hand_right
		leg_left_sprite.texture = skin.leg_left
		leg_right_sprite.texture = skin.leg_right
		foot_left_sprite.texture = skin.foot_left
		foot_right_sprite.texture = skin.foot_right
		shoe_left_sprite.texture = skin.shoe_left
		shoe_right_sprite.texture = skin.shoe_right
	get:
		return skin


@export_group("IK Nodes")
@export var head_ik: Node2D
@export var hand_right_ik: Node2D
@export var hand_left_ik: Node2D

@export_group("Sprites")
@export var head_sprite: Sprite2D
@export var eye_left_sprite: Sprite2D
@export var eye_right_sprite: Sprite2D
@export var pupil_left_sprite: Sprite2D
@export var pupil_right_sprite: Sprite2D
@export var eyebrow_left_sprite: Sprite2D
@export var eyebrow_right_sprite: Sprite2D
@export var mouth_sprite: Sprite2D
@export var body_sprite: Sprite2D
@export var hand_left_sprite: Sprite2D
@export var hand_right_sprite: Sprite2D
@export var leg_left_sprite: Sprite2D
@export var leg_right_sprite: Sprite2D
@export var foot_left_sprite: Sprite2D
@export var foot_right_sprite: Sprite2D
@export var shoe_left_sprite: Sprite2D
@export var shoe_right_sprite: Sprite2D
