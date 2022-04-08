extends Sprite

export (float) var speed:float = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var is_left = Input.is_action_pressed("move_left")
	var is_right = Input.is_action_pressed("move_right")
	var direction = int(is_right) - int(is_left)
			
	position.x += direction * speed * delta
