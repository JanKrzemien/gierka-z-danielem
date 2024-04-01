extends DisplayScene

var lvl_played: String

func config(parent: Node2D, params: Array):
	parent_node = parent
	lvl_played = params[0]
	var lvl_scene = load(lvl_played).instantiate()
	add_child(lvl_scene)
	
	
