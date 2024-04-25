extends Node

class_name Damagable

signal on_hit(node : Node, damage_taken : float, knockback_direction : Vector2, dmg_source)
signal on_heal(node : Node, health_restored : float)

@export var health : float = 20 :
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

func hit(dmg_source, damage : float, knockback_direction : Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction, dmg_source)

func heal(heal_source, heal: float):
	health += heal
	emit_signal("on_heal", heal_source, heal)
