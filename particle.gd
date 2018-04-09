extends KinematicBody2D

enum DIRECTION {LEFT, RIGHT}
export(DIRECTION) var direction = RIGHT
export(int) var speed = 100
# TODO: Particle should have a "weight" which factors into attraction force

var particle_type
var rotation_factor = randf() * 0.1

func calculate_diff(target):
	var vec = target - position
	var unit_vec = vec.normalized()
	var attraction = 3000 / vec.length()
	return unit_vec * attraction

func attract_to(target):
	position += calculate_diff(target)

func repel_from(target):
	position -= calculate_diff(target)

func _process(delta):
	
	set_rotation(get_rotation() + rotation_factor)
	
	if direction == LEFT:
		position.x -= delta * speed
	else:
		position.x += delta * speed

	# Free particles when no longer visible
	if not get_viewport_rect().has_point(position):
		queue_free()