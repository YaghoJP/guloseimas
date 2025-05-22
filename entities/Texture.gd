extends AnimatedSprite2D
class_name EnemyTexture

var _on_action: bool = false

func animate(_velocity: Vector2) -> void:
	if _on_action:
		return
	
	#if _velocity.y: 
		#if _velocity.y > 0:
			#play("fall")
		#if _velocity.y < 0:
			#play("jump")
		#return
	if _velocity.x:
		play("walk")
		return
	
	play("standing")
