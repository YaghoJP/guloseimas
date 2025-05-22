extends Node2D
class_name BaseLevel

@export_category("Level")
@export var _scene_path: String

func _ready():
	global.current_scene_path = _scene_path
	global.last_scene_path = _scene_path
	global.coins = 0
	global.score_before_level = global.score
