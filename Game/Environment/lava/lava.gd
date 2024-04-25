extends Node2D

@export var damage : int = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		for child in body.get_children():
			if child is Damagable:
				var direction_to_damageable = (body.global_position - get_parent().global_position)
				var direction_sign = sign(direction_to_damageable.x)
				child.hit(self, damage, Vector2.ZERO)
		
