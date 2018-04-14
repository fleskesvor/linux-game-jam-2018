extends Node2D

enum PARTICLE_TYPE {BLUE, GREEN, PINK}

onready var particle = preload("res://particle.tscn").instance()
# Determines by how much particles are scattered vertically from emitter
export var spread = 120
var timer

var sprites = {
	BLUE: preload("res://sprites/smell03.png"),
	GREEN: preload("res://sprites/smell02.png"),
	PINK: preload("res://sprites/smell01.png")
}

export(int) var wait_time = 3

func _ready():
	timer = Timer.new()
	add_child(timer)

	timer.connect("timeout", self, "emit_particle")
	timer.start()

func emit_particle():
	var clone = particle.duplicate()
	var rand = randi() % 3
	var particle_type = BLUE if rand == 0 else GREEN if rand == 1 else PINK

	clone.position = position
	# Randomize vertical lane and speed
	clone.position.y += randi() % spread - spread / 2
	clone.speed = randi() % 80 + 60
	clone.particle_type = particle_type
	clone.get_node("Sprite").texture = sprites[particle_type]

	get_parent().add_child(clone)

	# Randomize intervals
	timer.wait_time = randf() * 3 + 2