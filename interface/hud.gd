extends CanvasLayer
class_name HudManager

@export_category("Objects")
@export var _timer_counter: Label
@export var _coin_counter: Label
@export var _clock_timer: Timer

var minutes: int = 0
var seconds: int = 0

@export_category("Variables")
@export_range(0,5) var default_minutes:int = 0
@export_range(0,59) var default_seconds:int = 45

signal time_is_up()

func _ready():
	_coin_counter.text = str("%04d" % global.score)
	_timer_counter.text = str("%02d" % default_minutes) + ":" + str("%02d" % default_seconds)
	reset_clock_timer()
		
func _process(_delta):
	_coin_counter.text = str("%04d" %  global.score)
	if minutes == 0 and seconds == 0:
		#Lembrar de fazer aqui a parte do Game Over
		global.current_scene_path = "res://interface/game_over.tscn"
		transition.fade_in()
		
func _on_clock_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1
	_timer_counter.text = str("%02d" % minutes) + ":" + str("%02d" % seconds)
	
func reset_clock_timer():
	minutes = default_minutes
	seconds = default_seconds
