extends Node2D

@onready var rayCast = $RayCast2D
@onready var timer = $Timer

@export var bullet: PackedScene = null

var config = null
var tower_id: int = 0
var health: int = 0
var damage: int = 0
var speed: int = 0
var shoot_timer: float = 0
var durability_reduction: int = 0

var is_shoot: bool = true

var enemies = []

func set_config(config_path):
	config = load(config_path).new()
	
func set_tower(id: int):
	tower_id = id
	health = config.tower[tower_id]['health']
	damage = config.tower[tower_id]['damage']
	speed = config.tower[tower_id]['speed']
	shoot_timer = config.tower[tower_id]['timer']
	durability_reduction = config.tower[tower_id]['durability_reduction']
	
func set_timer():
	timer.wait_time = shoot_timer

func _update_look_at(enemy: Vector2):
	look_at(enemy)
	
func _physics_process(_delta):
	update_healthbar()
	if health < 1:
		queue_free()
		
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
		bullet_instance.speed = speed
		bullet_instance.damage = damage
		bullet_instance.global_position = global_position
		bullet_instance.global_rotation = rayCast.global_rotation + 0.1
		health -= durability_reduction
	timer.start()
	
func update_healthbar():
	$HealthBar.value = health
	
	if health >= 100:
		$HealthBar.visible = false
	else:
		$HealthBar.visible = true

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		enemies.append(body.get_parent())

func _on_body_exited(body):
	enemies.erase(body.get_parent())
