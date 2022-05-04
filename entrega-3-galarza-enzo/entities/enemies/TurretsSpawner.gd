extends Node2D

export (PackedScene) var turret_scene
export (Vector2) var lenght : Vector2

func _ready():
	call_deferred("_initialize")

func _initialize():
	var view:Rect2 = get_viewport().get_visible_rect()
	for i in 3:
		var turret_instance = turret_scene.instance()
		
		var turret_pos:Vector2 = Vector2(rand_range(view.position.x, view.end.x), rand_range(view.position.y, view.end.y))
		
		turret_instance.initialize(self, turret_pos, self)
