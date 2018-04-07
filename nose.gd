extends Area2D

const NOSTRILS = 0

func consume(particle):
	# emit signals to make meters update
	particle.queue_free()

func inhale():
	for body in get_overlapping_bodies():
		body.attract_to(position)

func exhale():
	for body in get_overlapping_bodies():
		body.repel_from(position)

func _input(event):
	if event is InputEventKey:
		if event.is_action("move_left"):
			position.x -= 10
		if event.is_action("move_right"):
			position.x += 10
		if event.is_action("inhale"):
			inhale()
		if event.is_action("exhale"):
			exhale()

func _on_nose_body_shape_entered(body_id, body, body_shape, area_shape):
	# var shape = shape_owner_get_shape(area_shape, 0)
	if area_shape == NOSTRILS:
		consume(body)
