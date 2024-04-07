extends Node2D

signal lvl_finished

@onready var transitioner = $CanvasLayer/Transitioner

func _ready():
	transitioner.transition_finished.connect(transition_animation_finished)


func transition_animation_finished():
	lvl_finished.emit()
