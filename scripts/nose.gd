extends Node2D

enum PARTICLE_TYPE {BLUE, GREEN, PINK}
const NOSTRILS = 0

var inhale = true
var nose_inhale_scale = Vector2(1.5, 1.5)
var update_bodies = false

func consume(particle):
	particle.queue_free()
	get_tree().call_group("meter", "increase", particle.particle_type)

func set_reach_rotation(rot):
	# Change rotation of area-of-effect
	$reach.rotation = rot
	#$Sprite.rotation = rot

func _input(event):
	# TODO: Make inhale+exhale work with mouse click+hold
	if event.is_action("move_left"):
		set_reach_rotation($reach.rotation + PI / 10)
	elif event.is_action("move_right"):
		set_reach_rotation($reach.rotation - PI / 10)
	elif event.is_action("inhale"):
		if event.is_pressed():
			inhale = true
			update_bodies = true
		else:
			update_bodies = false
	elif event.is_action("exhale"):
		if event.is_pressed():
			inhale = false
			update_bodies = true
		else:
			update_bodies = false
	elif event is InputEventMouseMotion:
		var angle = position.angle_to_point(event.position)
		set_reach_rotation(angle + PI / 2)

func _process(delta):
	if inhale and update_bodies:
		$Sprite.scale.x = lerp($Sprite.scale.x, nose_inhale_scale.x, 0.1)
		$Sprite.scale.y = lerp($Sprite.scale.y, nose_inhale_scale.y, 0.1)
	else:
		$Sprite.scale.x = lerp($Sprite.scale.x, 1, 0.1)
		$Sprite.scale.y = lerp($Sprite.scale.y, 1, 0.1)
	
	if update_bodies:
		for body in get_overlapping_bodies():
			if inhale:
				body.attract_to(position, delta)
			else:
				body.repel_from(position, delta)

func _ready():
	update_bodies = false

func _on_nose_body_shape_entered(body_id, body, body_shape, area_shape):
	# var shape = shape_owner_get_shape(area_shape, 0)
	if area_shape == NOSTRILS:
		consume(body)
