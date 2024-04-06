extends State

@export var walk_animation_name : String = "walk" 

func _ready():
	pass # Replace with function body.

func on_enter():
	playback.travel(walk_animation_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
