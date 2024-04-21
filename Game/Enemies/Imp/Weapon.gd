extends Area2D

@export var damage : int = 10
@export var character: Node2D

func _ready():
	monitoring = false

func _on_body_entered(body):
	for child in body.get_children():
		if child is Damagable:
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			
			child.hit(character, damage, direction_to_damageable)
