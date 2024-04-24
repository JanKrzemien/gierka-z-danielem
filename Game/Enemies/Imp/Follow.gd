extends State

class_name ImpFollow

@export var walk_animation_name : String = "walk"
@export var attack_animation_name : String = "attack"
@export var air_state: ImpAir
@export var attack_state: ImpAttack
@export var walk_state: ImpWalk

@export var left_follow_offset: int = 20
@export var right_follow_offset: int = 20

var attack_cooldown: bool = false
var distance_from_target: float

var target

func set_target(dmg_source):
	target = dmg_source

func on_exit():
	if next_state and next_state.has_method("set_target"):
		next_state.set_target(target)

func on_enter():
	character.movement_speed = character.follow_movement_speed
	playback.travel(walk_animation_name)

func state_process(delta):
	if target.is_dead:
		next_state = walk_state
		playback.travel(walk_animation_name)
	
	distance_from_target = character.global_position.distance_to(target.global_position)
	
	if not attack_cooldown and distance_from_target < character.attack_range:
		attack_cooldown = true
		next_state = attack_state
		playback.travel(attack_animation_name)
	elif character.global_position.x + left_follow_offset < target.global_position.x and character.move_direction.x < 0:
		character.turn_right()
	elif character.global_position.x - right_follow_offset > target.global_position.x and character.move_direction.x > 0:
		character.turn_left()
	
	if distance_from_target > character.follow_range:
		next_state = walk_state
	
	if(!character.is_on_floor()):
		next_state = air_state
	
func _on_attack_cooldown_timeout():
	attack_cooldown = false
