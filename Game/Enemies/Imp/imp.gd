extends CharacterBody2D

@export var move_direction : Vector2 = Vector2.LEFT
@export var movement_speed : float = 100.0

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite2D : Sprite2D = $Sprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var floor_ray_cast: RayCast2D = $FloorCheck
@onready var wall_ray_cast: RayCast2D = $WallCheck

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#TODO remove debug
@onready var debug_label: Label = $DebugState

func _ready():
	animation_tree.active = true
	
func _physics_process(delta):
	if state_machine.current_state is ImpWalk and (not floor_ray_cast.is_colliding() or wall_ray_cast.is_colliding()):
		self.scale.x *= -1
		move_direction.x *= -1
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if state_machine.check_if_can_move():
		velocity.x = move_direction.x * movement_speed
	else:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
	
	move_and_slide()
	
	#TODO remove debug
	debug_label.text = state_machine.current_state.name
