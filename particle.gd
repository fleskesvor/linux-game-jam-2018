extends KinematicBody2D

enum DIRECTION {LEFT, RIGHT}
export(DIRECTION) var direction = RIGHT
# TODO: Should be calculated based on "weight" instead
export(int) var speed = 100
export(int) var inhalation_effect = 10

var particle_type
var rotation_factor = randf() * 0.1

func attract_to(target):
	# TODO: Attraction should be inversely proportional to distance from nostrils
	var vec = target - position
	vec = vec.normalized()
	position += vec * inhalation_effect

func repel_from(target):
	var vec = target - position
	vec = vec.normalized()
	position -= vec * inhalation_effect

func _process(delta):
	
	set_rotation(get_rotation() + rotation_factor)
	
	if direction == LEFT:
		position.x -= delta * speed
	else:
		position.x += delta * speed

	# Free particles when no longer visible
	if not get_viewport_rect().has_point(position):
		queue_free()