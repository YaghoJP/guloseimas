extends BaseCharacter
class_name GDzinhaCharacter

var _gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _verticalMovement(_delta :float) -> void:

	if is_on_floor():
		_jump_count = 0
		
	if not is_on_floor():
			velocity.y += _gravity * _delta
			
	if Input.is_action_just_pressed("gdzinha_jump") and is_on_floor():
		velocity.y = - _jump_velocity

	if  Input.is_action_just_pressed("gdzinha_jump") and !is_on_floor() and _jump_count < 2 and _double_jump:
		_jump_count += 1
		velocity.y = - _jump_velocity
		return
		
func _horizontalMovement() -> void:

	var _direction = Input.get_axis("gdzinha_left", "gdzinha_rigth")
	if _direction:
		velocity.x = _direction * _speed
	else:
		velocity.x = move_toward(velocity.x, 0, _speed)
