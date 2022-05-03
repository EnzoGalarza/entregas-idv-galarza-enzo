extends Node2D

export (PackedScene) var turret_scene
export (Vector2) var lenght : Vector2
func _ready():
	call_deferred("_initialize")

func _initialize():
	for i in 3:
		var turret_instance = turret_scene.instance()
		
		var turret_pos:Vector2 = Vector2(rand_range(position.x, position.x + lenght.x), rand_range(position.y, position.y + lenght.y))
		
		turret_instance.initialize(self, turret_pos, self)
