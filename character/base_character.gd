extends CharacterBody2D
class_name BaseCharacter

@export_category("Objects")
@export var _character_texture: AnimatedSprite2D

@export_category("Variables")
@export var _speed: float = 150
@export var _double_jump: bool = false
@export var _jump_velocity: float = 250

var is_immortal: bool = false
var _jump_count: int = 0

func _physics_process(_delta):
	
	_verticalMovement(_delta)
	_horizontalMovement()
	_character_texture.animate(velocity)
	move_and_slide()
	
	for _plataform in get_slide_collision_count():
		var _collision = get_slide_collision(_plataform)
		if _collision.get_collider().has_method("_has_collided_with"):
			_collision.get_collider()._has_collided_with(_collision, self)
	
func _verticalMovement(_delta: float) -> void:
	pass
	
func _horizontalMovement() -> void:
	pass
	
func take_damage() -> void:
	knockback()
	_character_texture.action_animate("hurt")

func knockback() -> void:
	velocity.x = 2
	velocity.y = -1 * 250
	
	if !is_immortal:
		set_collision_layer_value(1, false)
		set_collision_mask_value(1,false)
	#var _knockback_direction: Vector2 = _entity.global_position.direction_to(global_position)
	#velocity.x = _knockback_direction.x * _knockback_speed
	#velocity.y = -1 * _knockback_speed
