extends Node2D

onready var particle = preload("res://particle.tscn").instance()

export(int) var wait_time = 3

func _ready():
	$Timer.wait_time = wait_time

# TODO: Randomize emission
func _on_Timer_timeout():
	var clone = particle.duplicate()
	clone.position = position
	get_parent().add_child(clone)