extends CharacterBody2D

class_name Imp

@export var move_direction : Vector2 = Vector2.LEFT
@export var walk_movement_speed: float = 100.0
@export var follow_movement_speed: float = 200.0
@export var attack_range: float = 50.0
@export var follow_range: float = 250.0
@export var knockback_force: float = 3000.0
@export var imp_dmg_sound : AudioStream
@export var imp_death_sound : AudioStream
@export var audio_player : AudioStreamPlayer


@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var floor_ray_cast: RayCast2D = $Flippendo/FloorCheck
@onready var wall_ray_cast: RayCast2D = $Flippendo/WallCheck
@onready var to_be_flipped: Node2D = $Flippendo

var movement_speed : float = walk_movement_speed

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_dead: bool = false

#TODO remove debug
@onready var debug_label: Label = $Flippendo/Debug/DebugState

func _ready():
	animation_tree.active = true
	
func _physics_process(delta):
	if state_machine.current_state is ImpWalk and (not floor_ray_cast.is_colliding() or wall_ray_cast.is_colliding()):
		to_be_flipped.set_scale(Vector2(-to_be_flipped.scale.x, to_be_flipped.scale.y))
		move_direction.x *= -1
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if state_machine.check_if_can_move():
		velocity.x = move_direction.x * movement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
	
	move_and_slide()
	
	#TODO remove debug
	debug_label.text = state_machine.current_state.name

func turn_right():
	move_direction.x = 1
	to_be_flipped.set_scale(Vector2(-abs(to_be_flipped.scale.x), to_be_flipped.scale.y))
	
func turn_left():
	move_direction.x = -1
	to_be_flipped.set_scale(Vector2(abs(to_be_flipped.scale.x), to_be_flipped.scale.y))
