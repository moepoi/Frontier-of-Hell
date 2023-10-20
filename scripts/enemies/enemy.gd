extends PathFollow2D

var config = null
var enemy_id: int = 0
var health: int = 0
var damage: int = 0
var speed: int = 0
var reward: int = 0
var direction_progress = []
var direction = []

var enemy_vol = Vector2(1,1)
var old_enemy_pos
var is_slow: bool = false

func set_config(config_path):
	config = load(config_path).new()

func set_enemy(id: int):
	enemy_id = id
	health = config.enemy[enemy_id]['health']
	damage = config.enemy[enemy_id]['damage']
	speed = config.enemy[enemy_id]['speed']
	reward = config.enemy[enemy_id]['reward']
	
func set_direction(type: int):
	var path_direction = config.game['path_direction'][type]
	for x in path_direction:
		direction_progress.append(x['progress'])
		direction.append(x['direction'])

func _ready():
	old_enemy_pos = global_position

func _process(delta):
	update_healthbar()
	change_direction(get_progress())
	if health < 1:
		get_tree().current_scene.on_enemy_reward(reward)
		queue_free()
	set_progress(get_progress() + speed * delta)
	enemy_vol = global_position - old_enemy_pos
	old_enemy_pos = global_position
	
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

func hit(value : int):
	health = health - value

func slow():
	var slowTimer = $EnemyBody/SlowTimer
	if is_slow:
		slowTimer.stop()
		slowTimer.start()
	else:
		speed = speed - (0.3 * speed)
		is_slow = true
		slowTimer.wait_time = 6.0
		slowTimer.start()

func _on_slow_timer_timeout():
	speed = config.enemy[enemy_id]['speed']
	is_slow = false

func destroy():
	queue_free()
