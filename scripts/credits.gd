extends Node2D

func _on_back_pressed():
	print("Button pressed")
	get_tree().change_scene("res://menu.tscn")

func _ready():
	$back.grab_focus()
