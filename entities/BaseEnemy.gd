extends CharacterBody2D
class_name BaseEnemy

var _gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var _on_floor: bool = true
var _direction: Vector2 = Vector2.ZERO

@export_category("Objects")
@export var _enemy_texture: AnimatedSprite2D
@export var _floor_detection: RayCast2D
@export var _wall_detection: RayCast2D


@export_category("Variables")
@export var _enemy_type: _types
@export var _move_speed: float = 128

enum _types  {STATIC = 0, CHASE = 1, WANDER = 2}

func _ready():
	_direction = [Vector2(-1, 0), Vector2(1,0)].pick_random()

	_update_direction()
func _physics_process(_delta: float) -> void:
	_veticalMovement(_delta)
	
	match _enemy_type:
		_types.STATIC:
			pass 
		_types.CHASE:
			pass
		_types.WANDER:
			_wandering()
	
	move_and_slide()

	_enemy_texture.animate(velocity)
	
func _wandering() -> void:
	if _floor_detection.is_colliding():
		if _floor_detection.get_collider() is TileMap:
			velocity.x = _direction.x * _move_speed
		if _wall_detection.is_colliding():
			if _wall_detection.get_collider() is TileMap:
				_update_direction()
				velocity.x = 0
		return
	
	#Se ele chegou aqui é porque atingiu o final da plataforma
	if is_on_floor():

		_update_direction()
		velocity.x = 0
		
func _update_direction():
	_direction.x = - _direction.x
	
	if _direction.x > 0:
		_enemy_texture.flip_h = true
	if _direction.x < 0:
		_enemy_texture.flip_h = false
	if _direction.x > 0:
		_wall_detection.scale.x = 1
	if _direction.x < 0:
		_wall_detection.scale.x = -1
	if _direction.x > 0:
		_floor_detection.scale.x = 1
	if _direction.x < 0:
		_floor_detection.scale.x = -1
		
		
func _veticalMovement(_delta: float) -> void:
	if not is_on_floor():
		velocity.y += _gravity * _delta
	
