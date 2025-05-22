extends Node
class_name Global

#controle de cenas
var current_scene: Node = null

var last_scene_path: String = ""
var current_scene_path: String = ""
var next_scene_path: String = ""
#Pontuação
var score_before_level: int = 0
var score: int = 0
var coins: int = 0

func quit_game() -> void:
	pass
