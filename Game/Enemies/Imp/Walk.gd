extends State

class_name ImpWalk

@export var walk_animation_name : String = "walk"
@export var air_state: ImpAir

func on_enter():
	character.movement_speed = character.walk_movement_speed
	playback.travel(walk_animation_name)

func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state

