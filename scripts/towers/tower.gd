extends Node2D

signal on_destroy(tower_placement_id)

@onready var rayCast = $RayCast2D
@onready var timer = $Timer
@onready var shoot = $Shoot

var bullet: PackedScene = null

var config = null
var tower_id: int = 0
var tower_placement_id = null
var health: int = 0
var damage: int = 0
var speed: int = 0
var shoot_timer: float = 0
var durability_reduction: int = 0
var area_damage: bool = false
var slow_effect: bool = false

var enemies = []

func set_config(config_path):
	config = load(config_path).new()
	
func set_tower(id: int, placement_id):
	tower_id = id
	tower_placement_id = placement_id
	bullet = config.tower[tower_id]['bullet']
	health = config.tower[tower_id]['health']
	damage = config.tower[tower_id]['damage']
	speed = config.tower[tower_id]['speed']
	shoot_timer = config.tower[tower_id]['timer']
	durability_reduction = config.tower[tower_id]['durability_reduction']
	area_damage = config.tower[tower_id]['area_damage']
	slow_effect = config.tower[tower_id]['slow_effect']
	
func set_timer():
	timer.wait_time = shoot_timer

func _update_look_at(enemy: Vector2):
	look_at(enemy)
	
func _physics_process(_delta):
	update_healthbar()
	if health < 1:
		on_destroy.emit(tower_placement_id)
		queue_free()
		
	if enemies.is_empty():
		$AnimatedSprite2D.stop()
	else:
		if !enemies[0].is_dead:
			var distance = global_position.distance_to(enemies[0].global_position)
			_update_look_at(enemies[0].global_position + enemies[0].enemy_vol * (distance / speed))
			if timer.is_stopped():
				$AnimatedSprite2D.play("default")
				_shoot()
		else:
			enemies.erase(enemies[0])
		
func _shoot():
	if bullet:
		# Check SFX Status
		if Global.sfx_status:
			shoot.play()
			
		var bullet_instance: Node2D = bullet.instantiate()
		bullet_instance.dir = rotation
		bullet_instance.rotation = rotation
		bullet_instance.global_position = global_position
		bullet_instance.speed = speed
		bullet_instance.damage = damage
		bullet_instance.area_damage = area_damage
		bullet_instance.area_damage_target = enemies
		bullet_instance.slow_effect = slow_effect
		get_tree().current_scene.add_child(bullet_instance)
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
