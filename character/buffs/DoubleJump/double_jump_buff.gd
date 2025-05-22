extends BaseBuff
class_name DoubleJumpBuff

func _applyBuff(_is_active: bool) -> void:
	if _is_active:
		_characterRoot._double_jump = true
		return
		
	_characterRoot._double_jump = false
	return
