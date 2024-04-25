extends State

@export var damageable : Damagable

func _ready():
	damageable.connect("on_heal", on_damageable_heal)

func on_damageable_heal(node : Node, heal_amount : float):
	if character.is_dead:
		return
	
	SignalBus.emit_signal("player_health_changed", heal_amount)
