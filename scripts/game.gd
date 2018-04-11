extends Node2D

var count_meters = 0
var filled_meters = {}

func filled_meter(type):
	filled_meters[type] = true
	if filled_meters.size() == count_meters:
		print("GAME WON!")

func _ready():
	for child in get_children():
		if child is preload("res://scripts/meter.gd"):
			count_meters += 1

	add_to_group("game")
