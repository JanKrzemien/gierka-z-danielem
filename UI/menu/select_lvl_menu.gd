extends DisplayScene

@export var back_button: PackedScene

@export var back_menu: String = "res://UI/menu/menu.tscn"

func _ready():
	$button_list.config(
		{
			back_button: _on_back_btn_pressed
		}
	)

func _on_back_btn_pressed():
	parent_node.switch_scenes(self, back_menu, [])
