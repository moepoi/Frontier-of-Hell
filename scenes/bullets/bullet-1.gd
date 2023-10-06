extends Area2D

const right = Vector2.RIGHT
@export var speed : int = 200
@export var damage : int = 20
	
func _physics_process(delta):
	var movement = right.rotated(rotation) * speed * delta
	global_position += movement

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("Enemy"):
		body.hit(damage)
		queue_free()
