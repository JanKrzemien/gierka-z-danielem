extends State

class_name HitState

@onready var timer : Timer = $Timer

@export var damageable : Damagable
@export var sprite2D : Sprite2D
@export var dead_state : State
@export var knockback_speed : float = 100.0
@export var return_state : State
@export var hit_animation_name : String = "hit" 

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	
func on_enter():
	timer.start()
	
func on_damageable_hit(node : Node, damage_amount : int, knockback_direction : Vector2):
	emit_signal("interrupt_state", self)
	
	if(damageable.health > 0):
		character.move_direction.x = -knockback_direction.x
		character.to_be_flipped.set_scale(Vector2(-character.move_direction.x*abs(character.to_be_flipped.scale.x), character.to_be_flipped.scale.y))
		
		playback.travel(hit_animation_name)
	else:
		next_state = dead_state

func _on_timer_timeout():
	next_state = return_state
