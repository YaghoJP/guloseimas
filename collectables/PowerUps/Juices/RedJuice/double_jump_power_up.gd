extends BasePowerUpCollectable
class_name DoubleJumpPowerUp

const _DOUBLE_JUMP = preload("res://character/buffs/DoubleJump/double_jump_buff.tscn")

@onready var collision = $Collision

func _on_body_entered(_body) -> void:
	_song.play()
	if _body is GDzinhaCharacter:
		_consume(_body)		#lembrar da animação após ser feito o consumo
		_deleteTimer.start()
		call_deferred("_disable_collision")
	
func _disable_collision() -> void:
	collision.disabled = true
	
func _consume(_body) -> void:
	_texture.play("collect")
	var _double_jump = _DOUBLE_JUMP.instantiate()
	_body.add_child(_double_jump)
