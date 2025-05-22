extends BaseCollectable
class_name BasePowerUpCollectable

@export_category("Objects")
@export var _deleteTimer: Timer

func _setPowerUP(_is_active: bool) -> void:
	pass

func _on_delete_timer_timeout():
	queue_free()
