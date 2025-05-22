extends BaseInteractable
class_name LeverInteractable

@export_category("Variables")
@export var _interact_duration: float = 3
@export var _interact_position: Vector2 = Vector2(0, 220)
@export var _interact_stop: float = 3

@export_category("Objects")
@export var _sound: AudioStreamPlayer

func _on_body_entered(_body) -> void:
	if _body is BaseCharacter and !_is_active:
		_texture.play("interact")
		_setInteract(_is_active, _interact_position, _interact_duration)
		_interact_timer.start(_interact_duration + _interact_stop)
		_sound.play()
		
		_is_active = true
		return
	
func _setInteract(_flag: bool, _position: Vector2, _interact_timing: float) -> void:
	if !_flag:
		_interactable_object.interact(_position, _interact_duration)
		return
	
func _setRelease():
	_interactable_object.release()
	return

func _on_interact_timer_timeout():
	_texture.play("idle")
	_is_active = false
	_setRelease()
