extends Area2D
class_name BaseDamageArea

func _on_body_entered(_body) -> void:
	if _body is BaseCharacter:
		_body.take_damage()
	
