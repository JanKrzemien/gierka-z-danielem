extends State

@export var walk_animation_name : String = "walk" 

func on_enter():
	playback.travel(walk_animation_name)
