extends BaseBuff
class_name InvencibleBba
func _applyBuff(_is_active: bool) -> void:
	if _is_active:
		_characterRoot.is_immortal = true
		return
	_characterRoot.is_immortal = false
	return
