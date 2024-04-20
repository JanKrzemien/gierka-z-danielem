extends State

class_name ImpAir

@export var walk_state: ImpWalk

func state_process(delta):
	if(character.is_on_floor()):
		next_state = walk_state
