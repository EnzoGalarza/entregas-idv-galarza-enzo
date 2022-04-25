extends Sprite

onready var fire_position : Position2D = $FirePosition

export (PackedScene) var projectile_scene : PackedScene

var projectile_container : Node

func fire():
	var projectile_instance : Projectile = projectile_scene.instance()
	var real_fire_position = fire_position.global_position - global_position
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(fire_position.global_position,real_fire_position.normalized())

func set_container(container : Node):
	projectile_container = container	
