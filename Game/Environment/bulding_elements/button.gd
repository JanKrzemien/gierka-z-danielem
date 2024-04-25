extends Node2D

@export var interactive: Interactive

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if (body.is_in_group("player")):
		if (interactive.is_active == true):
			interactive.is_active = false
			interactive.get_node("Sprite2D").visible = false
			interactive.get_node("StaticBody2D").set_collision_layer_value(1, false)
		else:
			pass
		
