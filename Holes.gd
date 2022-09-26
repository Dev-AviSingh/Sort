extends Node2D

var holeList = []
var holeTemplate
var main 
# Called when the node enters the scene tree for the first time.
func _ready():
	holeTemplate = preload("res://Hole.tscn")
	main = get_tree().get_root().get_child(0)
	var limits = get_viewport_rect().size
	var minimumDistanceYAxis = limits.y / 5
	for y in range(4):
		for x in range(2):
			var hole = holeTemplate.instance()
			add_child(hole)
			hole.global_position.x = rand_range(30+(limits.x/2 * x), limits.x/2 + (limits.x/2 * x) - 30)
			hole.global_position.y = y * minimumDistanceYAxis + 50
			holeList.append(hole)

func depositBall(val):
	main.increaseInk(val)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
