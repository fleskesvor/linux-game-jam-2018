extends VBoxContainer

func _on_MB_StartGame_pressed():
	get_tree().change_scene("res://game.tscn")

func _on_MB_Credits_pressed():
	get_tree().change_scene("res://credits.tscn")

func _on_MB_Quit_pressed():
	get_tree().quit()

func _ready():
	$MB_StartGame.grab_focus()
