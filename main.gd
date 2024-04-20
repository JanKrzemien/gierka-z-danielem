extends Node2D

@export var initial_scene: String = "res://UI/menu/menu.tscn"

func _ready():
	switch_scenes(null, initial_scene)

func switch_scenes(old_scene: Node2D, new_scene: String, new_scene_params: Dictionary = {}):
	if old_scene != null:
		old_scene.queue_free()
	
	var new_packed_scene: PackedScene = load(new_scene)
	var scene: Node2D = new_packed_scene.instantiate()
	scene.config(self, new_scene_params)
	
	add_child(scene)
