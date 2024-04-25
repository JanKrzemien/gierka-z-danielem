extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

@export var bonus: float = 10

func _ready():
	animation_player.play("idle")

func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		body.find_child("Damagable").heal(self, bonus)
		var tween = create_tween()
		tween.tween_property(self, "position", position + Vector2(0, -30), 0.5)
		animation_player.play("collected")
		await animation_player.animation_finished
		queue_free()
