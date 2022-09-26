extends Node2D


var inkReserve = 100
var maxInk = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reduceInk(val) -> bool:
	if inkReserve - val <= 0:
		return false
	inkReserve -= val
	inkReserve = clamp(inkReserve, 0, maxInk)
	return true
func increaseInk(val):
	inkReserve += val
	inkReserve = clamp(inkReserve, 0, maxInk)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(inkReserve)
