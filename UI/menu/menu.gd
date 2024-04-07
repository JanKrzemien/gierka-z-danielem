extends DisplayScene

@export var quit_button: PackedScene
@export var select_level_button: PackedScene

@export var submenu: String = "res://UI/menu/select_lvl_menu.tscn"

func _ready():
	$button_list.config(
		{
			select_level_button: _on_select_lvl_btn_pressed,
			quit_button: _on_quit_btn_pressed
		}
	)

func _on_select_lvl_btn_pressed():
	parent_node.switch_scenes(self, submenu)

func _on_quit_btn_pressed():
	get_tree().quit()
