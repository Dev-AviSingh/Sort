extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var points = PoolVector2Array()
var allowDrawObstacles = false
var obstacleWidth = 1
onready var main = get_tree().get_root().get_child(0)
onready var drawnObstacleTemplate = preload("res://Drawn Obstacle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if allowDrawObstacles:
		var pos = get_global_mouse_position()
		points.append(pos)
		
func _input(event):
	allowDrawObstacles = false
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(BUTTON_LEFT):
		allowDrawObstacles = true
	if event.is_action_released("ui_accept"):
		createObstacles()

func createObstacles():
	allowDrawObstacles = false
	var obstacle:StaticBody2D = drawnObstacleTemplate.instance()
	var newShape:ConcavePolygonShape2D = ConcavePolygonShape2D.new()
	var shapeOwnerId = obstacle.create_shape_owner(obstacle)
	
#	var previousSize = points.size()
#	var newPoints = points
#	newPoints.invert()
#	for i in range(newPoints.size()):
#		var point = newPoints[i]
#		point.x += 5
#		newPoints.set(i, point)
	
	# Optimise this later by recording the press point and the release point.
	var firstPoint = points[0]
	var lastPoint = points[-1]
	points.resize(2)
	points[0] = firstPoint
	points[1] = lastPoint
	
	
	
	obstacle.get_node("Line2D").points = PoolVector2Array(points)
	newShape.segments = PoolVector2Array(points)
	obstacle.shape_owner_add_shape(shapeOwnerId, newShape)
	
	points = PoolVector2Array()
	var inkUsed = firstPoint.distance_to(lastPoint)
	
	if not main.reduceInk(inkUsed):
		return
	add_child(obstacle)
	#print(obstacle)

