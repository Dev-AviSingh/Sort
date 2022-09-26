extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fadeTimer
var aliveTime = 3
var fadeInterval = 0.1
var alphaModulateValue= 0.01
# Called when the node enters the scene tree for the first time.
func _ready():
	fadeTimer = Timer.new()
	fadeTimer.connect("timeout", self, "fade")
	fadeTimer.wait_time = fadeInterval
	add_child(fadeTimer)
	fadeTimer.start()

func fade():
	if self.modulate.a <= 0:
		queue_free()
	self.modulate.a -= alphaModulateValue

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
