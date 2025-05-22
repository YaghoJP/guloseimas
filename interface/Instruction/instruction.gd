extends Control

func _on_button_back_pressed():
	global.current_scene_path = "res://interface/tile_screen.tscn"
	transition.fade_in()

