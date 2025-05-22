extends Control
class_name FinishLevel

@export_category("Object")
@export var _animation: AnimationPlayer

func _ready() -> void:
	_animation.play("collect_" + str(global.coins))
	
func _on_button_restart_pressed() -> void: 
	global.current_scene_path = global.last_scene_path
	global.score = global.score_before_level
	global.coins = 0
	transition.fade_in()

func _on_button_next_pressed() -> void:
	global.current_scene_path = global.next_scene_path
	global.coins = 0
	transition.fade_in()

func _on_button_quit_pressed() -> void:
	get_tree().quit()


