extends Area2D


const right = Vector2.RIGHT
var speed : int = 0
var damage : int = 0
var dir = 0

func _physics_process(delta):
	var move_dir = Vector2(1,0).rotated(dir)
	global_position += (move_dir * speed)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("Enemy"):
		body.get_parent().hit(damage)
		queue_free()
