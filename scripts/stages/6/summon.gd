extends Path2D

@onready var timer = $Timer
@export var type: int = 0

var config_path = "res://scripts/stages/6/config.gd"
var config = load(config_path).new()

var spawn_first: bool = true

var enemy: PackedScene = preload("res://scenes/enemies/demon.tscn")

func _ready():
	summon()
	timer.wait_time = config.game['spawn_timer']
	timer.start()

func _on_timer_timeout():
	summon()
	timer.start()

func summon():
	var rng = RandomNumberGenerator.new()
	
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
	enemy_instance.set_config(config_path)
	enemy_instance.set_enemy(0)
	enemy_instance.set_direction(type)
	enemy_instance.set_v_offset(rng.randf_range(config.game['offset'][0], config.game['offset'][1]))
