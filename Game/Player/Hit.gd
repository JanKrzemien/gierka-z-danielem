extends State

class_name PlayerHitState

@onready var timer : Timer = $Timer

@export var damageable : Damagable
@export var sprite2D : Sprite2D
@export var dead_state : State
@export var knockback_speed : float = 100.0
@export var return_state : State
@export var return_animation_name: String = "move"
@export var hit_animation_name : String = "hit"
@export var death_animation_name : String = "dead"

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	
func on_enter():
	timer.start()

func on_damageable_hit(node : Node, damage_amount : int, knockback_direction : Vector2, dmg_source):
	if character.is_dead:
		return
	emit_signal("interrupt_state", self)
	
	SignalBus.emit_signal("player_health_changed", -damage_amount)
	
	if(damageable.health > 0):
		character.velocity.x += knockback_direction.x * dmg_source.knockback_force
		playback.travel(hit_animation_name)
	else:
		character.velocity = Vector2.ZERO
		character.is_dead = true
		next_state = dead_state
		playback.travel(death_animation_name)

func _on_timer_timeout():
	if character.is_dead:
		return
	next_state = return_state
	playback.travel(return_animation_name)
