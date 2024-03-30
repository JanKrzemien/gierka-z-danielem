extends Node2D

@export var initial_scene: PackedScene

func _ready():
	switch_scenes(null, initial_scene)

func switch_scenes(old_scene: Node2D, new_scene: PackedScene, new_scene_params: Array = []):
	if old_scene != null:
		old_scene.queue_free()
	
	var scene: Node2D = new_scene.instantiate()
	scene.config(self, new_scene_params)
	
	add_child(scene)
