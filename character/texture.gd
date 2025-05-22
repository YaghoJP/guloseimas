extends AnimatedSprite2D
class_name CharacterTexture

@export_category("Objects")
@export var _character: BaseCharacter

var _is_action: bool = false

func animate(_velocity: Vector2) -> void:
	if _is_action:
		return
	
	#Flipando
	_direction(_velocity.x)
	
	if _velocity.y != 0:
		if _velocity.y < 0:
			play("jump")
		if _velocity.y > 0:
			play("jump")		#Se posteriormente tiver a animação de fall
		return
		
	if _velocity.x != 0 and _velocity.y == 0:
		play("run")
		return
		
	if _velocity.x == 0 and _velocity.y == 0:
		play("idle")
		return
func action_animate(_action_name: String) -> void:
	_is_action = true
	play(_action_name)
		
func _direction(_direct: float) -> void:
	if _direct > 0:
		flip_h = false
	if _direct < 0:
		flip_h = true
	return

func _on_animation_finished() -> void:

	if animation == "hurt":
		_is_action = false
		if _character.is_immortal:
			return
		
		global.last_scene_path = global.current_scene_path
		global.current_scene_path = "res://interface/game_over.tscn"
		transition.fade_in()
