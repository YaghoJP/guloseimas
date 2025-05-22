extends CanvasLayer
class_name Transition

@export_category("Objects")
@export var _animation: AnimationPlayer

var _scene_path: String

func fade_in() -> void:
	_scene_path = global.current_scene_path
	_animation.play("fade_in")
func _on_animation_finished(_anim_name: String) -> void:
	match _anim_name:
		"fade_in":
			get_tree().change_scene_to_file(_scene_path)
			_animation.play("fade_out")
			
		"fade_out":
			pass
