extends CharacterBody2D
class_name Bullet

@export_category("Variables")
@export var _velocity: float = 400.0  # Velocidade do projétil

@export_category("Objects")
@export var _texture: Sprite2D

var direction :int = 1 
 
func _process(delta):
	position.x += _velocity * direction * delta

func set_direction(dir):
	direction = dir
	if dir < 0:
		_texture.flip_h = true
	else:
		_texture.flip_h = false

func _on_timer_to_queue_free_timeout():
	queue_free()

func _on_hit_box_body_entered(_body) -> void:
	if _body is BaseCharacter:
		_body.take_damage()
		queue_free()
		return
		
	if _body is TileMap:
		queue_free()

