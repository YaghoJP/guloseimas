extends Control
class_name TitleScreen

@export_category("Level")
@export var _scene_path: String

@export_category("Objects")
@export var _texture_utfano: AnimatedSprite2D
@export var _texture_gdzinha: AnimatedSprite2D

func _ready():
	global.current_scene_path = _scene_path

func _on_button_start_pressed():
	global.current_scene_path = "res://level/level_1.tscn"
	transition.fade_in()

func _on_button_credits_pressed():
	global.current_scene_path = "res://interface/credits.tscn"
	transition.fade_in()

func _on_button_quit_pressed():
	get_tree().quit()


func _on_texture_ut_fano_animation_finished():
	_texture_utfano.play("idle")

func _on_texture_g_dzinha_animation_finished():
	_texture_gdzinha.play("idle")


func _on_button_instruction_pressed():
	global.current_scene_path = "res://interface/Instruction/instruction.tscn"
	transition.fade_in()
