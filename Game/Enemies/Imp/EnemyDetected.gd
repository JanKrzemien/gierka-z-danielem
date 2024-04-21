extends State

class_name ImpEnemyDetected

@export var follow_state: ImpFollow

func _on_detection_area_body_entered(body):
	if body.is_in_group('player'):
		emit_signal("interrupt_state", self)
		
		next_state = follow_state
		if next_state and next_state.has_method("set_target"):
			next_state.set_target(body)
