extends DisplayScene

@export var scene_to_load : String

var lvl_played: String

func config(parent: Node2D, params: Dictionary):
	parent_node = parent
	lvl_played = params["lvl_file_path"]
	var lvl_scene = load(lvl_played).instantiate()
	lvl_scene.lvl_finished.connect(on_lvl_finished)
	add_child(lvl_scene)

func on_lvl_finished():
	parent_node.switch_scenes(self, scene_to_load, {})
