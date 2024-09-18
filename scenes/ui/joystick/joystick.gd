@tool

@icon("assets/icon.svg")

extends Node2D

signal stick_moved(position: Vector2)
signal stick_reset()

@export var stick: Sprite2D
@export var border: Sprite2D

@export_range(0, 100000) var detect_radius: float = 90 : 
	set(value):
		detect_radius = value
		$DetectRadius.shape.radius = value
	get:
		return detect_radius
		
@export_range(0, 100000) var reset_radius: float = 200 : 
	set(value):
		reset_radius = value
		$ResetRadius.shape.radius = value
	get:
		return reset_radius
		
## touch is not detected if the given 
## joysticks are in touch
@export var touch_exceptions: Array[Node]

var touched: bool = false

func _check_exception_nodes() -> void:
	for node: Node in touch_exceptions:
		if not node.has_method("touched"):
			printerr("Node in the list has no method touched")

func _others_in_touch() -> bool:
	for node: Node in touch_exceptions:
		if node.touched:
			return true
	return false

func _ready() -> void:
	_check_exception_nodes()

func _input(event: InputEvent) -> void:
	if _others_in_touch():
		return
	
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.pressed):
		var distance: float = event.position.distance_to(border.global_position)
		
		if not touched and (distance > detect_radius):
			# touch is outside of the joystick, so return
			return
		
		touched = true
		stick.global_position = event.position
		stick.position = border.position + (stick.position - border.position).limit_length(detect_radius)
		stick_moved.emit(stick.position.normalized())
		
		if distance > reset_radius:
			touched = false
			stick.position = Vector2.ZERO
			stick_reset.emit()
			
	elif event is InputEventScreenTouch and not event.pressed:
		touched = false
		stick.position = Vector2.ZERO
		stick_reset.emit()
		
func _process(delta: float) -> void:
	pass
		
