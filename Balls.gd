extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var ballTemplate = preload("res://Ball.tscn")
var spawnTimer
var timeInterval = 1
var limits
# Called when the node enters the scene tree for the first time.
func _ready():
	limits = get_viewport_rect().size
	spawnTimer = Timer.new()
	spawnTimer.wait_time= timeInterval
	spawnTimer.connect("timeout", self, "spawnBall")
	spawnTimer.one_shot = false
	spawnTimer.autostart = true
	add_child(spawnTimer)

func spawnBall():
	var ball = ballTemplate.instance()
	add_child(ball)
	ball.global_position.x = rand_range(0, limits.x)
	ball.global_position.y = -50

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
