extends Node2D

@export var k : float = 0.015
@export var d : float = 0.03
@export var spread : float = 0.2

var springs = []
var passes = 8

@export var distance_beetween_springs = 32
@export var spring_number = 6

@onready var water_spring = preload("res://Game/Environment/water/water_spring.tscn")

@export var depth = 1000
var target_height = global_position.y
var bottom = target_height + depth

@onready var water_polygon = $Water_Polygon
@onready var water_border = $Water_Border

@export var border_thickness = 1.1

# Called when the node enters the scene tree for the first time.
func _ready():
	spread = spread / 1000
	water_border.width = border_thickness
	for i in range(spring_number):
		var x_position = distance_beetween_springs * i
		var w = water_spring.instantiate()
		add_child(w)
		springs.append(w)
		w.initialize(x_position, i)
		w.set_collision_width(distance_beetween_springs)
		w.connect("splash", Callable(self, "splash"))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in springs:
		i.water_update(k,d)
		
	var left_deltas = []
	var right_deltas = []
	
	for i in range(springs.size()):
		left_deltas.append(0)
		right_deltas.append(0)
	
	for j in range(passes): 
		for i in range(springs.size()):
			if i > 0:
				left_deltas[i] = spread * (springs[i].height - springs[i-1].height)
				springs[i-1].velocity += left_deltas[i]
			if i < springs.size() - 1:
				right_deltas[i] = spread * (springs[i].height - springs[i+1].height)
				springs[i+1].velocity += right_deltas[i]
				
	draw_water_body()
	new_border()
			
func splash(index, speed):
	if index >= 0 and index < springs.size():
		springs[index].velocity += speed
	
func draw_water_body():
	
	var surface_points = []
	
	for i in range(springs.size()):
		surface_points.append(springs[i].position)
		
	var first_index = 0
	var last_index = surface_points.size()-1
	
	var water_polygon_points = surface_points
	
	water_polygon_points.append(Vector2(surface_points[last_index].x, bottom))
	water_polygon_points.append(Vector2(surface_points[first_index].x, bottom))
	
	water_polygon_points = PackedVector2Array(water_polygon_points)
	
	water_polygon.set_polygon(water_polygon_points)
	water_polygon.set_uv(water_polygon_points)
	
func new_border():
	var curve = Curve2D.new().duplicate()
	
	var surface_points = []
	for i in range(springs.size()):
		surface_points.append(springs[i].position)
		
	for i in range(surface_points.size()):
		curve.add_point(surface_points[i])
		
	water_border.curve = curve
	water_border.smooth(true)
	water_border.queue_redraw()
	

