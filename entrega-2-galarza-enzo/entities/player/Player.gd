extends Sprite

onready var cannon : Sprite = $Cannon

export (float) var acceleration:float = 20.0
export (float) var speed_limit:float = 600.0
export (float) var friction_weight:float = 0.1

var projectile_container : Node
var velocity : Vector2 = Vector2.ZERO

func set_projectile_container(container : Node):
	cannon.set_container(container)
	projectile_container = container

func _physics_process(delta):
	
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var mouse_position : Vector2 = get_global_mouse_position()
	
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	if direction_optimized != 0:
		velocity.x	= clamp(velocity.x + (direction_optimized * acceleration), -speed_limit, speed_limit)
	else:
		velocity.x = lerp(velocity.x, 0, friction_weight) if abs(velocity.x) > 1 else 0	
	position += velocity * delta
