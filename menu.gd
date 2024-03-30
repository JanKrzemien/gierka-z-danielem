extends Node2D

@export var submenu: PackedScene

var parent_node: Node2D

func config(parent: Node2D, params: Array):
	parent_node = parent

func _on_select_lvl_btn_pressed():
	parent_node.switch_scenes(self, submenu, [self])

func _on_quit_btn_pressed():
	get_tree().quit()
