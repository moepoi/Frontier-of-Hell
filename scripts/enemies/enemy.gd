extends PathFollow2D

var config = null
var enemy_id: int = 0
var health: int = 0
var speed: int = 0

func set_config(config_path):
	config = load(config_path).new()

func set_enemy(id: int):
	enemy_id = id
	health = config.enemy[enemy_id]['health']
	speed = config.enemy[enemy_id]['speed']

func _process(delta):
	update_healthbar()
	if health <= 0:
		queue_free()
	set_progress(get_progress() + speed * delta)
		
func update_healthbar():
	$Enemy/HealthBar.value = health
	
	if health >= 100:
		$Enemy/HealthBar.visible = false
	else:
		$Enemy/HealthBar.visible = true

func hit(damage : int):
	health = health - damage
