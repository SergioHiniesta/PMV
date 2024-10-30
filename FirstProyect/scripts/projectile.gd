extends RigidBody2D

var projVelocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Asigno la direccion a la velocidad
	linear_velocity = projVelocity

func _on_timer_timeout():
	queue_free()
