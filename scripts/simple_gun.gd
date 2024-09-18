@tool
extends Gun

class_name SimpleGun

		
@export var resource: SimpleGunResource:
	set(value):
		resource = value
		if value != null:
			resource.connect("changed", _update)
			_update()


var sprite: Sprite2D = Sprite2D.new()
var bullet_marker: Marker2D = Marker2D.new()
var bullet_scene: PackedScene
var bullet_audio: AudioStreamPlayer2D = AudioStreamPlayer2D.new()
var bullet_cooldown_timer: Timer = Timer.new()
var _debug: Node

func _update() -> void:
	bullet_cooldown_timer.wait_time = resource.bullet_cooldown_time
	bullet_cooldown_timer.one_shot = true
	sprite.texture = resource.texture
	bullet_marker.global_position = resource.hold_position
	bullet_audio.stream = resource.bullet_audio
	print("changed")

func _ready() -> void:
	
	bullet_marker.gizmo_extents = 100
	
	
	add_child(bullet_cooldown_timer)
	add_child(sprite)
	add_child(bullet_marker)
	add_child(bullet_audio)
	
	
	print("hi")


func shoot() -> void:
	if not bullet_cooldown_timer.is_stopped():
		return 
		
	var bullet: SimpleBullet = bullet_scene.instantiate()

	bullet.global_position = bullet_marker.global_position
	bullet.rotation = bullet_marker.global_rotation 
	bullet.direction = bullet_marker.global_transform.x.normalized()
	
	# making the bullet lose accuracy
	bullet.direction = bullet.direction.rotated((randf() * 2 - 1) * (1 - resource.accuracy))
	
	projectile_spawn_path.add_child.call_deferred(bullet)
	bullet_cooldown_timer.start()
	#bullet_audio.pitch_scale = 1 + (randf() * 2 - 1) / 10
	bullet_audio.play()
