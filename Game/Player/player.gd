extends CharacterBody2D

class_name Player

signal player_died

@export var speed : float = 200.0
@export var speed_in_water : float = 150.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

var is_in_water : bool = false
var is_dead: bool = false

signal facing_direction_changed(facing_right : bool)

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO


# TODO DEBUG USUNĄĆ
@onready var debug_states: Label = $DebugLabel

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if not is_dead:
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		direction = Input.get_vector("left", "right", "up", "down")
		
		# Control whether to move or not to move
		if direction.x != 0 && state_machine.check_if_can_move():
			if (not is_in_water):
				velocity.x = direction.x * speed
			else:
				velocity.x = direction.x * speed_in_water
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()
	update_animation_parameters()
	update_facing_direction()
	
	# TODO DEBUG USUNĄĆ
	debug_states.text = state_machine.current_state.name
	

	
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
		emit_signal("facing_direction_changed", !sprite.flip_h)
	elif direction.x < 0:
		sprite.flip_h = true
		
	emit_signal("facing_direction_changed", !sprite.flip_h)
	
func _input(event : InputEvent):
	if (event.is_action_pressed("down") && is_on_floor()):
		position.y += 1
