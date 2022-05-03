extends Sprite

onready var lifetime_timer = $LifetimeTimer
onready var hitbox = $Hitbox

export (float) var VELOCITY:float = 800.0

var direction:Vector2

func initialize(container, spawn_position:Vector2, direction:Vector2):
	container.add_child(self)
	self.direction = direction
	global_position = spawn_position
	lifetime_timer.connect("timeout", self, "_on_lifetime_timer_timeout")
	lifetime_timer.start()

func _physics_process(delta):
	position += direction * VELOCITY * delta

# Si supero una cantidad de tiempo de vida
func _on_lifetime_timer_timeout():
	_remove()

func _remove():
	var parent = get_parent()
	if parent != null:
		parent.remove_child(self)
	queue_free()
	


func _on_Hitbox_body_entered(body):
	if body is Player or body is Turret:
		body.get_hit() # Replace with function body.
	hitbox.collision_mask = 0	
	call_deferred("_remove")
