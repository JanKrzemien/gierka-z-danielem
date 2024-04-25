extends DisplayScene

@export var scene_to_load : String
@export var player : CharacterBody2D
@export var player_ui : CanvasLayer

@onready var lvl_sibling = $Camera2D

var lvl_playing: Node2D

func config(parent: Node2D, params: Dictionary):
	parent_node = parent
	lvl_playing = load(params["lvl_file_path"]).instantiate()
	lvl_playing.lvl_finished.connect(on_lvl_finished)
	player.player_died.connect(players_death)
	SignalBus.connect("player_health_changed", player_health_changed)
	player_ui.find_child("Health").text = str(player.find_child("Damagable").health)

func _ready():
	lvl_sibling.add_sibling(lvl_playing)

func player_health_changed(value):
	player_ui.find_child("Health").text = str(float(player_ui.find_child("Health").text) + value)

func players_death():
	lvl_playing.player_dead = true
	player_ui.visible = false

func on_lvl_finished():
	parent_node.switch_scenes(self, scene_to_load, {})
