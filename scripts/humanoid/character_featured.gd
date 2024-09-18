@tool
extends HumanoidCharacter

class_name HumanoidCharacterFeatured

@export var right_hand_weapon_feature: CharacterWeaponFeature
@export var left_hand_weapon_feature: CharacterWeaponFeature

@export_group("Weapon Paths")
@export var right_hand_gun_hold_path: Node2D
@export var left_hand_gun_hold_path: Node2D
