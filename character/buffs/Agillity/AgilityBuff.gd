extends BaseBuff
class_name AgillityBuff

@export_category("Variables")
@export var _adictionalAgillity: float = 100

func _applyBuff(_is_active: bool) -> void:
	if _is_active:
		_characterRoot._speed += _adictionalAgillity
		return
		
	_characterRoot._speed -= _adictionalAgillity
	return
