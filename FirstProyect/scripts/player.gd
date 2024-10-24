extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
# Precargo la bala
@onready var bullet = preload("res://scenes/bullet.tscn")
@onready var marker_2d = $Marker2D

func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	# Instancio la bala cuando pulso el botón de disparar
	if Input.is_action_just_pressed("shoot"):
		var bulletTemp = bullet.instantiate()
		var bulletSprite = bulletTemp.get_node("Sprite2D")
		# Ajusto la posicion del proyectil con un marker
		bulletTemp.position = marker_2d.position
		
		# Ajusto la direccion del proyectil en funcion de hacia donde mira el pj
		if animated_sprite.flip_h == false:
			bulletTemp.direction = Vector2(1 , 0)
			bulletSprite.flip_v = false
		elif animated_sprite.flip_h == true:
			bulletTemp.direction = Vector2(-1 , 0)
			bulletSprite.flip_v = true
			
		add_child(bulletTemp)
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#Flip de sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
