extends Area2D

func _on_body_entered(body):
	if(body.is_in_group("player")):
		var maxBodyScale = Vector2(1.5,1.5)
	
	#If the body scale is less than 1.5 the player size
	#increases each time you got a coin
	
		if body.scale < maxBodyScale:
			body.scale *= 1.1
		
		queue_free()
	

