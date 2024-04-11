extends CheckButton

signal transition_finished

@export var transitioner : Transitioner

func _ready():
	transitioner.animation_finished.connect(on_animation_finished)

func on_animation_finished():
	transition_finished.emit()

func _on_toggled(toggled_on):
	print(toggled_on)
	if(toggled_on):
		transitioner.set_new_animation_playing(transitioner.end_lvl_anim)
	else:
		transitioner.set_new_animation_playing(transitioner.start_lvl_anim)
