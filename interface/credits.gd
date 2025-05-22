extends Control

func _on_button_pressed():
	global.current_scene_path = "res://interface/tile_screen.tscn"
	transition.fade_in()
