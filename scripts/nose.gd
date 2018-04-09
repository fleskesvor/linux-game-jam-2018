extends Node2D

enum PARTICLE_TYPE {BLUE, GREEN, PINK}
const NOSTRILS = 0

func consume(particle):
	particle.queue_free()
	get_tree().call_group("meter", "increase", particle.particle_type)

func inhale():
	for body in get_overlapping_bodies():
		body.attract_to(position)

func exhale():
	for body in get_overlapping_bodies():
		body.repel_from(position)

func set_reach_rotation(rot):
	# Change rotation of area-of-effect
	$reach.rotation = rot
	$Sprite.rotation = rot

func _input(event):
	# TODO: Make inhale+exhale work with mouse click+hold
	if event is InputEventKey:
		if event.is_action("move_left"):
			set_reach_rotation($reach.rotation + PI / 10)
		if event.is_action("move_right"):
			set_reach_rotation($reach.rotation - PI / 10)
		if event.is_action("inhale"):
			inhale()
		if event.is_action("exhale"):
			exhale()
	if event is InputEventMouseMotion:
		var angle = position.angle_to_point(event.position)
		set_reach_rotation(angle + PI / 2)

func _on_nose_body_shape_entered(body_id, body, body_shape, area_shape):
	# var shape = shape_owner_get_shape(area_shape, 0)
	if area_shape == NOSTRILS:
		consume(body)
