extends State

class_name PlayerDeadState

func on_death_anim_ended():
	character.player_died.emit()
