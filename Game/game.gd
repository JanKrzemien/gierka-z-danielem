extends DisplayScene

var lvl_played: String

func config(parent: Node2D, params: Dictionary):
	parent_node = parent
	lvl_played = params["lvl_file_path"]
	var lvl_scene = load(lvl_played).instantiate()
	add_child(lvl_scene)
	
	
