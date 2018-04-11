extends Node2D

enum PARTICLE_TYPE {BLUE, GREEN, PINK}
const NOSTRILS = 0

var inhale = true

func consume(particle):
	particle.queue_free()
	get_tree().call_group("meter", "increase", particle.particle_type)

func set_reach_rotation(rot):
	# Change rotation of area-of-effect
	$reach.rotation = rot
	$Sprite.rotation = rot

func _input(event):
	if event.is_action("move_left"):
		set_reach_rotation($reach.rotation + PI / 10)
	elif event.is_action("move_right"):
		set_reach_rotation($reach.rotation - PI / 10)
	elif event.is_action("inhale"):
		if event.is_pressed():
			inhale = true
			set_process(true)
		else:
			set_process(false)
	elif event.is_action("exhale"):
		if event.is_pressed():
			inhale = false
			set_process(true)
		else:
			set_process(false)
	elif event is InputEventMouseMotion:
		var angle = position.angle_to_point(event.position)
		set_reach_rotation(angle + PI / 2)
	elif event is InputEventJoypadMotion:
		var vector = Vector2(Input.get_joy_axis(0, JOY_ANALOG_LX), Input.get_joy_axis(0, JOY_ANALOG_LY))
		if vector.length() > 0.3:
			set_reach_rotation(vector.angle() - PI / 2)

func _process(delta):
	for body in get_overlapping_bodies():
		if inhale:
			body.attract_to(position, delta)
		else:
			body.repel_from(position, delta)

func _ready():
	set_process(false)

func _on_nose_body_shape_entered(body_id, body, body_shape, area_shape):
	# var shape = shape_owner_get_shape(area_shape, 0)
	if area_shape == NOSTRILS:
		consume(body)
