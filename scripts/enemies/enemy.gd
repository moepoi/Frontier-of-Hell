extends PathFollow2D

var config = null
var enemy_id: int = 0
var health: int = 0
var damage: int = 0
var speed: int = 0
var reward: int = 0
var direction_progress = []
var direction = []

func set_config(config_path):
	config = load(config_path).new()

func set_enemy(id: int):
	enemy_id = id
	health = config.enemy[enemy_id]['health']
	damage = config.enemy[enemy_id]['damage']
	speed = config.enemy[enemy_id]['speed']
	reward = config.enemy[enemy_id]['reward']
	
func set_direction():
	var path_direction = config.game['path_direction']
	for x in path_direction:
		direction_progress.append(x['progress'])
		direction.append(x['direction'])

func _process(delta):
	update_healthbar()
	change_direction(get_progress())
	if health < 1:
		get_tree().current_scene.on_enemy_reward(reward)
		queue_free()
	set_progress(get_progress() + speed * delta)
	
func change_direction(current_progress):
	if !direction_progress.is_empty():
		if current_progress > direction_progress[0]:
			$EnemyBody/AnimatedSprite2D.play(direction[0])
			direction_progress.erase(direction_progress[0])
			direction.erase(direction[0])
		
func update_healthbar():
	$EnemyBody/HealthBar.value = health
	
	if health >= 100:
		$EnemyBody/HealthBar.visible = false
	else:
		$EnemyBody/HealthBar.visible = true

func hit(damage : int):
	health = health - damage

func destroy():
	queue_free()
