extends Sprite

onready var fire_position : Position2D = $FirePosition

export (PackedScene) var projectile_scene : PackedScene

var projectile_container

func fire():
	var proj_instance = projectile_scene.instance()
	proj_instance.initialize(projectile_container, fire_position.global_position, global_position.direction_to(fire_position.global_position))

func set_container(container):
	projectile_container = container
