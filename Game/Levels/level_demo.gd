extends Node2D

signal lvl_finished

@onready var transition_button = $CanvasLayer/TransButton

func _ready():
	transition_button.transition_finished.connect(transition_animation_finished)

func transition_animation_finished():
	lvl_finished.emit()
