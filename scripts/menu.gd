extends VBoxContainer

func _ready():
	pass

func _process(delta):
	pass

func _on_MB_StartGame_pressed():
	get_tree().change_scene("res://game.tscn")

func _on_MB_Quit_pressed():
	get_tree().quit()
