extends Path2D


@onready var timer = $Timer
@export var type: int = 0

var config_path = "res://scripts/stages/1/config.gd"
var config = load(config_path).new()

var enemies = []
var probabilities = []

func _ready():
	for enemy in config.enemy:
		enemies.append(enemy['asset'])
		probabilities.append(enemy['spawn_rate'])

	summon_init()

	timer.wait_time = config.game['spawn_timer']
	timer.start()

func weighted_random_choice(items, weights):
	var total_weight = 0
	for weight in weights:
		total_weight += weight

	var random_value = randf() * total_weight

	for i in range(len(items)):
		random_value -= weights[i]
		if random_value <= 0:
			return items[i]

func _on_timer_timeout():
	summon_init()
	timer.start()

func summon_init():
	for x in range(config.game['spawn_count']):
		summon(weighted_random_choice(enemies, probabilities))
		await get_tree().create_timer(config.game['spawn_delay']).timeout

func summon(enemy: PackedScene):
	var rng = RandomNumberGenerator.new()
	
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
	enemy_instance.set_config(config_path)
	enemy_instance.set_enemy(0)
	enemy_instance.set_direction(type)
	enemy_instance.set_v_offset(rng.randf_range(config.game['offset'][0], config.game['offset'][1]))
