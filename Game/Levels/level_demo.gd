extends Node2D

class_name GameManager

signal lvl_finished

signal toggle_game_paused(is_paused : bool)

@export var transition_button : Button
@export var end_screen : CanvasLayer
@export var player_died_end_text : String = "Game Over"

var player_dead : bool = false:
	get:
		return player_dead
	set(value):
		if value == true:
			player_died()
		player_dead = value

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		if not player_dead:
			game_paused = value
			get_tree().paused = game_paused
			emit_signal("toggle_game_paused", game_paused)
		
func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused

func _ready():
	transition_button.transition_finished.connect(transition_animation_finished)

func player_died():
	end_screen.find_child("EndText").text = player_died_end_text
	end_screen.visible = true
	transition_button._on_toggled(true)
	transition_button.disabled = true

func transition_animation_finished():
	lvl_finished.emit()
