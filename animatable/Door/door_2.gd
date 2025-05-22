extends BaseAnimatable
class_name DoorAnimatable2

var posicao_inicial: Vector2
var _platform_tween
var _duration_interact

func _ready():
	posicao_inicial = get_global_position()
	
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
		
