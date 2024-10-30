extends Area2D

var direction = Vector2(-1, 0)
var velocity = Vector2(300, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	# Asigno la direccion a la velocidad
	velocity.x *= direction.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta

func _on_area_2d_body_entered(body):
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("slime"):
		area.get_parent().queue_free()
		queue_free()
		
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
