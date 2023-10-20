extends Area2D


const right = Vector2.RIGHT
var speed: int = 0
var damage: int = 0
var dir = 0
var area_damage: bool = false
var area_damage_target = []
var slow_effect: bool = false

func _physics_process(_delta):
	var move_dir = Vector2(1,0).rotated(dir)
	global_position += (move_dir * speed)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("Enemy"):
		if area_damage:
			for enemy in area_damage_target:
				enemy.hit(damage)
		elif slow_effect:
			body.get_parent().hit(damage)
			body.get_parent().slow()
		else:
			body.get_parent().hit(damage)
		queue_free()
