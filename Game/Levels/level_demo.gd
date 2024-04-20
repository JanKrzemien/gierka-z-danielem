extends Node2D

class_name GameManager

signal lvl_finished

signal toggle_game_paused(is_paused : bool)
# Called when the node enters the scene tree for the first time.

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)
		
func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused

@onready var transition_button = $CanvasLayer/TransButton

func _ready():
	transition_button.transition_finished.connect(transition_animation_finished)

func transition_animation_finished():
	lvl_finished.emit()
