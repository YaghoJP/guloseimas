extends BasePowerUpCollectable

const _INVENCIBLE = preload("res://character/buffs/Invencible/invencible_buff.tscn")

@onready var collision = $Collision

func _on_body_entered(_body) -> void:
	_song.play()
	if _body is UTFanoCharacter:
		_consume(_body)		#lembrar da animação após ser feito o consumo
		#_deleteTimer.start()
		call_deferred("_disable_collision")
	
func _disable_collision() -> void:
	collision.disabled = true
	
func _consume(_body) -> void:
	_texture.play("collect")
	var _invencible = _INVENCIBLE.instantiate()
	_body.add_child(_invencible)
