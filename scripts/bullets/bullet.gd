extends Area2D


const right = Vector2.RIGHT
var speed: int = 0
var damage: int = 0
var dir = 0
var area_damage: bool = false
var slow_effect: bool = false

var enemies = []
var stop: bool = false

func _physics_process(_delta):
	if stop:
		return
	var move_dir = Vector2(1,0).rotated(dir)
	global_position += (move_dir * speed)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("Enemy"):
		if area_damage:
			$Sprite2D.hide()
			stop = true
			$AnimatedSprite2D.visible = true
			$AnimatedSprite2D.play("default")
			for enemy in enemies:
				enemy.hit(damage)
			await get_tree().create_timer(0.5).timeout
		elif slow_effect:
			body.get_parent().hit(damage)
			body.get_parent().slow()
		else:
			body.get_parent().hit(damage)
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		enemies.append(body.get_parent())

func _on_body_exited(body):
	enemies.erase(body.get_parent())