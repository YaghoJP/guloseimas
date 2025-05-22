extends BaseAnimatable
class_name FallingPlatform

@export_category("Objects")
@export var _respawn_timer: Timer
@export var _animation: AnimationPlayer
@export var _texture: Sprite2D

@export_category("Variables")
@export var _reset_timer: float = 3.0

var _velocity: Vector2 = Vector2.ZERO
var _gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var _respawn_position
var _is_triggered: bool = false

func _ready():
	_respawn_position = global_position
	set_physics_process(false)

func _physics_process(_delta) -> void:
	_velocity.y += _gravity * _delta
	position += _velocity * _delta
	
func _has_collided_with(_collision: KinematicCollision2D, _collider: BaseCharacter) -> void:
	
	if _is_triggered:
		return
	
	_is_triggered = true
	_animation.play("shake")
	_velocity = Vector2.ZERO


func _on_animation_animation_finished(_anim_name):
	set_physics_process(true)
	_respawn_timer.start(_reset_timer)

func _on_respawn_timer_timeout():
	set_physics_process(false)
	global_position = _respawn_position
	
	if _is_triggered:
		var spawn_tween = create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
		spawn_tween.tween_property(_texture, "scale", Vector2(1,1), 0.2).from(Vector2(0,0))
	_is_triggered = false
	
