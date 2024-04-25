extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		#zwiekszenie hp gracza
		var tween = create_tween()
		tween.tween_property(self, "position", position + Vector2(0, -30), 0.5)
		animation_player.play("collected")
		await animation_player.animation_finished
		queue_free()
