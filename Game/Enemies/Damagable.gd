extends Node

class_name Damagable

signal on_hit(node : Node, damage_taken : int, knockback_direction : Vector2)

@export var health : float = 20 :
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

@export var dead_animation_name : String = "dead"

func hit(damage : int, knockback_direction : Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
