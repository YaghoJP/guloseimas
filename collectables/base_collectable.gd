extends Area2D
class_name BaseCollectable

@export_category("Object")
@export var _texture: AnimatedSprite2D
@export var _song: AudioStreamPlayer

func _on_body_entered(_body) -> void:
	pass
		
func _consume(_body) -> void:
	pass
