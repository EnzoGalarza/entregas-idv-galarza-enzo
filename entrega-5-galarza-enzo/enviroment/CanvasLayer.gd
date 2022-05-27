extends CanvasLayer

onready var color_rect : ColorRect = $ColorRect
onready var scene_transition : Tween = $Tween
var changing = false

func change_scene():
	layer = 1
	
	scene_transition.interpolate_property(color_rect,"color",
								color_rect.color,
								Color.black,1)
	changing = true									
	scene_transition.start()
	yield(scene_transition,"tween_completed")
	changing = false
	
func reset():
	layer = -1
	color_rect.color = Color.white
	changing = false
