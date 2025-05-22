extends CharacterBody2D
class_name Cannon

const BULLET = preload("res://entities/Canhao/bullet/bullet.tscn")

@export_category("Objects")
@export var _bullet_spawn: Marker2D
@export var _texture: AnimatedSprite2D

@export_category("Variables")
@export var _bullet_delay: float = 2.0  # Tempo entre os tiros em segundos

var _time_last_shoot: float = 0.0

func _atirar() -> void:
	#_texture.play
	var _bullet = BULLET.instantiate()  # Cria uma instância do tiro
	if sign(_bullet_spawn.position.x) == 1:
		_bullet.set_direction(1)
	else:
		_bullet.set_direction(-1)
		
	add_sibling(_bullet)
	_bullet.global_position = _bullet_spawn.global_position


func _on_timer_shoot_timeout():
	_atirar()
