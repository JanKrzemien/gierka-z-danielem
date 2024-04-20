extends DisplayScene

@export var lvls_dir_path: String = "res://Game/Levels/"
@export var back_button: PackedScene

@export var game: String = "res://Game/game.tscn"
@export var back_menu: String = "res://UI/menu/menu.tscn"

func create_packed_button(scene_num):
	var button: Button = Button.new()
	button.text = "Poziom " + str( scene_num )
	button.size_flags_horizontal = true
	var scene: PackedScene = PackedScene.new()
	var result: int = scene.pack(button)
	if result == OK:
		return scene
	else:
		return null

func _ready():
	var buttons: Dictionary = {}
	var dir = DirAccess.open(lvls_dir_path)
	var regex: RegEx = RegEx.new()
	regex.compile('tscn$')
	
	if dir:
		dir.list_dir_begin()
		var lvl_file_name: String = dir.get_next()
		var scene_num: int = 1
		var result: RegExMatch
		
		while lvl_file_name != "":
			result = regex.search(lvl_file_name)
			
			if result == null:
				lvl_file_name = dir.get_next()
				continue
				
			var button = create_packed_button(scene_num)
			if button != null:
				buttons[button] = func ():
					parent_node.switch_scenes(self, game, { "lvl_file_path": lvls_dir_path + lvl_file_name })
			lvl_file_name = dir.get_next()
			scene_num += 1
	
	buttons[back_button] = _on_back_btn_pressed
	
	$button_list.config(
		buttons
	)

func _on_back_btn_pressed():
	parent_node.switch_scenes(self, back_menu)
