extends Node2D

export var MIN_X = -10
export var MAX_X = 10
export var MIN_Y = -15
export var MAX_Y = 8

var start_position = Vector2(0, 0)
var viewport_size = Vector2(0, 0)
var next_position = Vector2(0, 0)

func _input(event):
	if event is InputEventMouseMotion:
		var offset_x = event.position.x - viewport_size.x * 0.5
		var offset_y = event.position.y - viewport_size.y * 0.5
		next_position.x = start_position.x + clamp(offset_x, MIN_X, MAX_X)
		next_position.y = start_position.y + clamp(offset_y, MIN_Y, MAX_Y)

func _ready():
	start_position = position
	next_position = start_position
	viewport_size = get_viewport().get_visible_rect().size

func _process(delta):
	position.x = lerp(position.x, next_position.x, 0.1)
	position.y = lerp(position.y, next_position.y, 0.1)