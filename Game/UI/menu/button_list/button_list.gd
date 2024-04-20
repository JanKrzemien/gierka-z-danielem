extends Control

@onready var buttons_container: VBoxContainer = %menu_btns

func get_button_ready(scene: PackedScene, function):
	var button = scene.instantiate()
	button.pressed.connect(function)
	return button

func config(dict: Dictionary):
	var buttons: Array[Button] = []
	
	for key in dict:
		buttons.append(get_button_ready(key, dict[key]))
	
	for button in buttons:
		buttons_container.add_child(button)
