extends "res://entities/AbstractState.gd"
var normal_velocity : Vector2
onready var dash_timer : Timer = get_node("../../DashTimer")

func enter():
	normal_velocity = parent.velocity
	parent.apply_dash()
	dash_timer.start()
	
func exit():
	parent.set_velocity(normal_velocity)
	
func update(delta):
	parent._apply_movement()

func _on_DashTimer_timeout():
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left"):
		emit_signal("finished","walk")
	else:
		emit_signal("finished","idle")	
