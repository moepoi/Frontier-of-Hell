extends Node2D

@onready var rayCast = $RayCast2D
@onready var timer = $Timer

@export var bullet: PackedScene = null

var config = load("res://scripts/stages/1/config.gd").new()

var is_shoot: bool = true

var enemies = []

func _update_look_at(enemy: Vector2):
	look_at(enemy)
	
func _physics_process(_delta):
	if enemies.is_empty():
		$AnimatedSprite2D.stop()
	else:
		_update_look_at(enemies[0].global_position)
		if timer.is_stopped():
			$AnimatedSprite2D.play("default")
			_shoot()
		
func _shoot():
	if bullet:
		var bullet_instance: Node2D = bullet.instantiate()
		get_tree().current_scene.add_child(bullet_instance)
		bullet_instance.global_position = global_position
		bullet_instance.global_rotation = rayCast.global_rotation + 0.1
	timer.start()

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		enemies.append(body.get_parent())

func _on_body_exited(body):
	enemies.erase(body.get_parent())
