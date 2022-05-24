extends "res://entities/AbstractState.gd"

func enter():
	parent._play_animation("dead")	
	yield(get_tree().create_timer(0.98), "timeout")
	Transition.change_scene()
	
	
func update(delta):
	parent._handle_deacceleration()
	parent._apply_movement()
