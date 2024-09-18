extends Node

class_name Health

signal health_zeroed
signal health_changed(hp: int)

@export var hp: int = 100:
	set(new_hp):
		if new_hp <= 0:
			health_zeroed.emit()
		if new_hp != hp:
			health_changed.emit(new_hp)
		hp = new_hp
	get:
		return hp
