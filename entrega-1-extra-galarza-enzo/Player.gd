extends Area2D

signal hit
export var speed = 400 #Represent velocity of player in pixel/sec.
var screen_size #Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	var velocity = Vector2.ZERO #Movement vector
	
	var is_right = Input.is_action_pressed("move_right")
	var is_left  = Input.is_action_pressed("move_left")
	var is_down  = Input.is_action_pressed("move_down")
	var is_up    = Input.is_action_pressed("move_up")
	
	##Same as check with if and update variable velocity
	
	velocity.x = int(is_right) - int(is_left)
	velocity.y = int(is_down) - int(is_up) 
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()							
	
	position += velocity * delta
	position.x = clamp(position.x,0, screen_size.x)
	position.y = clamp(position.y,0,screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
			


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
