extends Node2D

@export var interactive: Interactive

@onready var animation_name : String = "move_loop"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func action():
	if (interactive.is_active == false):
		interactive.is_active = true
		interactive.get_node("platform/AnimationPlayer").play(animation_name)
	else:
		interactive.is_active = false
		interactive.get_node("platform/AnimationPlayer").stop()
		
#move_loop
	
