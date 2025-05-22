extends Node2D
class_name BaseBuff

var _characterRoot: BaseCharacter

@export_category("Variables")
@export var _powerUp_timer: Timer
@export var _powerUp_duration: float = 3

func _ready():
	_characterRoot = self.get_parent()
	_applyBuff(true)
	_powerUp_timer.start(_powerUp_duration)
	
func _applyBuff(_is_active: bool) -> void:
	pass
	
func _on_buff_timer_timeout() -> void:
	_applyBuff(false)
