extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var parent = get_parent()
export var multiplyingFactorBallValue = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var overlappingBodies = get_overlapping_bodies()
	if overlappingBodies.size() > 0:
		for body in overlappingBodies:
			if body is RigidBody2D:
				parent.depositBall(body.inkValue * multiplyingFactorBallValue)
				body.queue_free()
