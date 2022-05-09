extends KinematicBody2D
class_name Player

onready var cannon = $Cannon

export (float) var ACCELERATION:float = 20.0
export (float) var H_SPEED_LIMIT:float = 600.0
export (float) var FRICTION_WEIGHT:float = 0.1
export (int) var JUMP_SPEED:float = -400
export (int) var GRAVITY:float = 10

var velocity:Vector2 = Vector2.ZERO
var projectile_container

func initialize(projectile_container):
	self.projectile_container = projectile_container
	cannon.projectile_container = projectile_container

func _get_input():
	var mouse_position:Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)
	
	# Cannon fire
	if Input.is_action_just_pressed("fire_cannon"):
		if projectile_container == null:
			projectile_container = get_parent()
			cannon.projectile_container = projectile_container
		cannon.fire()
	
	# Player movement
	var h_movement_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if h_movement_direction != 0:
		velocity.x = clamp(velocity.x + (h_movement_direction * ACCELERATION), -H_SPEED_LIMIT, H_SPEED_LIMIT)
	else:
		velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0
	
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = JUMP_SPEED
		
func get_hit():
	print('Game over')
	call_deferred("_game_over")
	
func _game_over():
	set_physics_process(false)		
	hide()
	collision_layer = 0
			
func _physics_process(delta):
	_get_input()
	
	velocity.y += GRAVITY
	move_and_slide(velocity,Vector2.UP)
	
	#position += velocity * delta
		 