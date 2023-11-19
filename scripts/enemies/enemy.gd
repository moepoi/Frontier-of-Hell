extends PathFollow2D

var config = null
var enemy_id: int = 0
var health: int = 0
var damage: int = 0
var speed: float = 0
var reward: int = 0
var direction_progress = []
var direction = []
var current_direction = ''

var enemy_vol = Vector2(1,1)
var old_enemy_pos
var max_health: int = 0
var is_slow: bool = false
var is_dead: bool = false

func set_config(config_path):
	config = load(config_path).new()

func set_enemy(id: int):
	enemy_id = id
	health = config.enemy[enemy_id]['health']
	damage = config.enemy[enemy_id]['damage']
	speed = config.enemy[enemy_id]['speed']
	reward = config.enemy[enemy_id]['reward']

	max_health = health
	$EnemyBody/HealthBar.max_value = max_health
	$EnemyBody/HealthBar.visible = false
	
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
	if !is_dead:
		if health < 1:
			is_dead = true
			$EnemyBody.remove_from_group("Enemy")
			$EnemyBody/AnimatedSprite2D.play("{direction}_dead".format({"direction": current_direction}))
			get_tree().current_scene.on_enemy_reward(reward)
			$EnemyBody/DeadTimer.start()
		
		set_progress(get_progress() + speed * delta)
		enemy_vol = global_position - old_enemy_pos
		old_enemy_pos = global_position
	else:
		$EnemyBody/HealthBar.visible = false
	
func change_direction(current_progress):
	if !direction_progress.is_empty():
		if current_progress > direction_progress[0]:
			$EnemyBody/AnimatedSprite2D.play(direction[0])
			current_direction = direction[0]
			direction_progress.erase(direction_progress[0])
			direction.erase(direction[0])
		
func update_healthbar():
	$EnemyBody/HealthBar.value = health
	
	if health < max_health:
		$EnemyBody/HealthBar.visible = true

func hit(value : int):
	health = health - value

func slow():
	var slowTimer = $EnemyBody/SlowTimer
	if is_slow:
		slowTimer.stop()
		slowTimer.start()
	else:
		$EnemyBody/AnimatedSprite2D.modulate = Color(0.0627, 0.3137, 0.4588, 1)
		speed = speed - (0.3 * speed)
		is_slow = true
		slowTimer.wait_time = 6.0
		slowTimer.start()

func _on_slow_timer_timeout():
	$EnemyBody/AnimatedSprite2D.modulate = Color(1, 1, 1, 1)
	speed = config.enemy[enemy_id]['speed']
	is_slow = false

func _on_dead_timer_timeout():
	destroy()

func destroy():
	queue_free()