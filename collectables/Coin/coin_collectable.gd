extends BaseCollectable

@onready var collision = $Collision

func _on_body_entered(_body) -> void:
	if _body is BaseCharacter:
		_consume(_body)
		
func _consume(_body) -> void:
	_texture.play("collect")
	_song.play()
	global.score += 100
	global.coins += 1
	call_deferred("_disable_collision")
	

func _disable_collision() -> void:
	collision.disabled = true
	
func _on_texture_animation_finished():
	if _texture.animation == "collect":
		queue_free()
