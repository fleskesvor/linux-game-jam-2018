extends ProgressBar

enum PARTICLE_TYPE {BLUE, GREEN, PINK}
export(PARTICLE_TYPE) var particle_type

func increase(type):
	if type == particle_type:
		value += 20
	if value == max_value:
		get_tree().call_group("game", "filled_meter", type)

func _ready():
	add_to_group("meter")