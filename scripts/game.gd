extends Node2D

var count_meters = 0
var filled_meters = {}

func filled_meter(type):
	filled_meters[type] = true
	if filled_meters.size() == count_meters:
		print("GAME WON!")
		$ui_gameover.visible = true

func _ready():
	for child in get_children():
		if child is preload("res://scripts/meter.gd"):
			count_meters += 1
	add_to_group("game")
	$ui_gameover.visible = false

func _on_btn_restart_pressed():
	get_tree().change_scene("res://game.tscn")
	pass # replace with function body


func _on_btn_quit_pressed():
	get_tree().change_scene("res://menu.tscn")
	pass # replace with function body
