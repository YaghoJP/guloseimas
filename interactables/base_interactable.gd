extends Area2D
class_name BaseInteractable

@export_category("Obejcts")
@export var _interactable_object: AnimatableBody2D #talvez terá que ser alterado.
@export var _texture: AnimatedSprite2D
@export var _interact_timer: Timer


var _is_active: bool = false

func _on_body_entered(_body) -> void:
	pass
	
func _setInteract(_flag: bool, _position: Vector2, _interact_timing: float) -> void:
	pass
	
func _setRelease():
	pass

func _on_interact_timer_timeout():
	pass
