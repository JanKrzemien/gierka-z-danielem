extends State

class_name GroundState

@onready var buffer_timer : Timer = $BufferTimer

@export var player : Player
@export var jump_velocity : float = -450.0
@export var jump_in_water : float = -450.0
@export var falling_animation : String = "falling"
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack_state : State
@export var attack_node : String = "attack1"

func state_process(_delta):
	if(!character.is_on_floor() && buffer_timer.is_stopped()):
		playback.travel(falling_animation)
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		attack()
		
func jump():
	if (player.is_in_water == false):
		character.velocity.y = jump_velocity
	else:
		character.velocity.y = jump_in_water
	next_state = air_state
	playback.travel(jump_animation)
func attack():
	next_state = attack_state
	playback.travel(attack_node)
