extends Label

@export var float_speed : Vector2 = Vector2(0, -60)
@export var pos_x: int = -15

func _process(delta):
	position.x = pos_x
	position += float_speed * delta

func _on_timer_timeout():
	queue_free()
