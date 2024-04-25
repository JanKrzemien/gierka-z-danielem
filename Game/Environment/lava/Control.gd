@tool
extends Control

@export var speed : Vector3
var off : Vector3 = Vector3.ZERO

@onready var texture : TextureRect = $TextureRect

func _process(delta):
	off += speed * delta
	off.x = fmod(off.x, 1000.0)
	off.y = fmod(off.y, 1000.0)
	off.z = fmod(off.z, 1000.0)
	texture.texture.noise.offset = off
