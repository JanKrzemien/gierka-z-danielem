extends State

class_name DeadState

@export var death_animation_name : String = "dead"

func on_enter():
	playback.stop()
	playback.start(death_animation_name)
	character.audio_player.stream = character.imp_death_sound
	character.audio_player.play()

func on_death_anim_ended():
	#TODO potężnie hardcoded, zobaczyć czy da się to zrobić lepiej
	get_parent().get_parent().queue_free()
