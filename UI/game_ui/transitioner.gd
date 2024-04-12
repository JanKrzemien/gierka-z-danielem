extends Control

class_name Transitioner

signal animation_finished

@export var end_lvl_anim : String = "fade_out"
@export var start_lvl_anim : String = "fade_in"

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready():
	animation_tex.visible = false

func set_new_animation_playing(animation_name):
	var delta: float = animation_player.current_animation_position
	var anim_length: float = animation_player.current_animation_length
	animation_player.play(animation_name)
	animation_player.advance(anim_length - delta)

func switch_animation(fade_out):
	set_new_animation_playing(end_lvl_anim) if fade_out else set_new_animation_playing(start_lvl_anim)

func _on_fade_out_animation_finished():
	animation_finished.emit()

