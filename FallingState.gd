extends State

@export var falling_animation_name : String = "falling"
@export var ground_state : State

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == falling_animation_name):
		next_state = ground_state
