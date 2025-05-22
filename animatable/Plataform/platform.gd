extends BaseAnimatable
class_name Platform

const WAIT_DURATION := 1.0

var posicao_inicial: Vector2
var _platform_tween
var _duration_interact
var plataform_center:int = 16

@export_category("Variables")
@export var _is_interactable: bool = false
@export var _end_position: Vector2
@export var _mov_duration: float
@export var move_horizontal:bool = true

func _ready():
	posicao_inicial = get_global_position()
	
	if _is_interactable:
		move_plataform()
	
func interact(_position: Vector2, _duration: float) -> void:
	
	_duration_interact = _duration
	if _platform_tween != null:
		_platform_tween.kill()
	_platform_tween = get_tree().create_tween()
	_platform_tween.tween_property(self, "global_position", posicao_inicial - _position, _duration)

func release() -> void:
	if _platform_tween != null:
		_platform_tween.kill()
		
	_platform_tween = get_tree().create_tween()
	_platform_tween.chain().tween_property(self, "global_position", posicao_inicial, _duration_interact)
		

func move_plataform():
	var move_direction = Vector2.RIGHT * _end_position if move_horizontal else Vector2.UP * _end_position
	var duration = move_direction.length() / float(_mov_duration * plataform_center)
	
	if _platform_tween != null:
		_platform_tween.kill()
		
	_platform_tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	_platform_tween.tween_property(self, "global_position",  posicao_inicial - _end_position, _mov_duration).set_delay(WAIT_DURATION)
	_platform_tween.tween_property(self, "global_position", posicao_inicial, duration).set_delay(_mov_duration * WAIT_DURATION)
