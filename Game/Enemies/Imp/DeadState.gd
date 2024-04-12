extends State

class_name DeadState

@export var death_animation_name : String = "dead"

func on_enter():
	character.movement_speed = 0
	playback.travel(death_animation_name)

func on_death_anim_ended():
	#TODO potężnie hardcoded, zobaczyć czy da się to zrobić lepiej
	get_parent().get_parent().queue_free()
