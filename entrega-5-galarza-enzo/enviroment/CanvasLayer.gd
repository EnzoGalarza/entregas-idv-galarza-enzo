extends CanvasLayer

onready var color_rect : ColorRect = $ColorRect
onready var scene_transition : Tween = $Tween

func change_scene():
	layer = 1
	
	scene_transition.interpolate_property(color_rect,"color",
								color_rect.color,
								Color.black,1)
	scene_transition.start()
	
func reset():
	layer = -1
	color_rect.color = Color.white
