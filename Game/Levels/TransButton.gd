extends CheckButton

signal transition_finished

@export var transitioner : Transitioner

func _ready():
	transitioner.animation_finished.connect(on_animation_finished)

func on_animation_finished():
	transition_finished.emit()

func _on_toggled(toggled_on):
	transitioner.switch_animation(toggled_on)
