@tool

extends "joystick.gd"

@export_enum("cyan", "gray", "red", "NULL") var color: String = "gray" : 
	set(value):
		if value != "NULL":
			stick_texture = null
			stick.texture = load("res://ui/joystick/assets/colors/stick_%s.svg" % value)
		color = value
	get:
		return color

@export var stick_texture: Texture :
	set(texture):
		stick.texture = texture
		stick_texture = texture
