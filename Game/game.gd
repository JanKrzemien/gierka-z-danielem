extends DisplayScene

@export var scene_to_load : String
@export var player : CharacterBody2D

@onready var lvl_sibling = $Camera2D

var lvl_playing: Node2D

func config(parent: Node2D, params: Dictionary):
	parent_node = parent
	lvl_playing = load(params["lvl_file_path"]).instantiate()
	lvl_playing.lvl_finished.connect(on_lvl_finished)
	player.player_died.connect(players_death)

func _ready():
	lvl_sibling.add_sibling(lvl_playing)

func players_death():
	lvl_playing.player_dead = true

func on_lvl_finished():
	parent_node.switch_scenes(self, scene_to_load, {})
