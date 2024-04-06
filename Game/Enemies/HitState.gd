extends State

class_name HitState

@onready var timer : Timer = $Timer

@export var damageable : Damagable
@export var dead_state : State
@export var dead_animation_node : String = "dead"
@export var knockback_speed : float = 100.0
@export var return_state : State
@export var hit_animation_name : String = "hit" 

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	
func on_enter():
	
	timer.start()
	
func on_damageable_hit(node : Node, damage_amount : int, knockback_direction : Vector2):
	if(damageable.health > 0):
		character.velocity = knockback_speed * knockback_direction
		emit_signal("interrupt_state", self)
		playback.travel(hit_animation_name)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		
func on_exit():
	character.velocity = Vector2.ZERO

func _on_timer_timeout():
	next_state = return_state
