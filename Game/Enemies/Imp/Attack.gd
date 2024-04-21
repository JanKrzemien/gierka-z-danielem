extends State

class_name ImpAttack

@export var walk_animation_name: String = "walk"
@export var return_state: State

@onready var timer: Timer = $Attack_cooldown

func attack_finished():
	timer.start()
	
	next_state = return_state
	playback.travel(walk_animation_name)
