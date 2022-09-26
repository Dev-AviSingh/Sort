extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var limits = get_viewport_rect().size
var inkValue
# Called when the node enters the scene tree for the first time.
func _ready():
	inkValue = $CollisionShape2D.shape.radius


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if global_position.y > limits.y + 50:
		queue_free()
