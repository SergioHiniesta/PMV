extends Area2D

var direction = Vector2(-1, 0)
var velocity = Vector2(300, -150)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	# Asigno la direccion a la velocidad
	velocity.x *= direction.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Aplico gravedad al proyectil
	velocity.y += gravity * delta
	position += velocity * delta

