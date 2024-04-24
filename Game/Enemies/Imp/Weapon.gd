extends Area2D

@export var damage : int = 10
@export var character: Node2D

func _ready():
	monitoring = false

func _on_body_entered(body):
	for child in body.get_children():
		if child is Damagable:
			child.hit(character, damage, character.move_direction)
