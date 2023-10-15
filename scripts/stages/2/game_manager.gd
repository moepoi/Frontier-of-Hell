extends Node2D

var config_path = "res://scripts/stages/2/config.gd"
var config = load(config_path).new()

var data = {
	"paused": false,
	"tower": {},
	"health": config.game['health'],
	"resource": config.game['resource']
}

func _ready():
	$CanvasLayer/GameStats.connect("on_paused", on_game_paused)
	$CanvasLayer/PauseMenu.connect("on_resume", on_game_resume)
	$CanvasLayer/GameStats.set_resource(data['resource'])
	var bases = $Bases.get_children()
	for base in bases:
		base.connect("enemy_entered_base", on_enemy_entered_base)
	var placements = $Placements.get_children()
	for placement in placements:
		placement.connect("on_placement", on_tower_placement)
	$CanvasLayer/TowerMenu.connect("build_tower", on_build_tower)

func on_game_paused():
	data['paused'] = !data['paused']
	get_tree().paused = data['paused']
	$CanvasLayer/PauseMenu.show_menu()

func on_game_resume():
	data['paused'] = !data['paused']
	get_tree().paused = data['paused']
	$CanvasLayer/PauseMenu.hide_menu()
	
func on_tower_placement(pos, tower_placement_id):
	var tower_id = null
	var disabled = false
	var disabled_2 = false
	if data['tower'].has(str(tower_placement_id)):
		match data['tower'][str(tower_placement_id)]['id']:
			0:
				tower_id = 2
			1:
				tower_id = 3
			2:
				tower_id = 4
			3:
				tower_id = 5
			_:
				tower_id = null
		
		if data['resource'] < config.menu[tower_id]['price']:
			disabled = true
	else:
		if data['resource'] < config.menu[0]['price']:
			disabled = true
		if data['resource'] < config.menu[1]['price']:
			disabled_2 = true
	$CanvasLayer/TowerMenu.show_menu(tower_id, pos, tower_placement_id, disabled, disabled_2)

func on_build_tower(pos, tower_id, tower_placement_id):
	if data['tower'].has(str(tower_placement_id)):
		var current_tower = get_tree().current_scene.get_node(str(data['tower'][str(tower_placement_id)]['name']))
		current_tower.queue_free()
	else:
		data['tower'][str(tower_placement_id)] = {}
		
	var tower = config.tower[tower_id]['asset'].instantiate()
	get_tree().current_scene.add_child(tower)
	tower.set_config(config_path)
	tower.set_tower(tower_id, tower_placement_id)
	tower.set_timer()
	tower.global_position = pos
	tower.connect("on_destroy", on_tower_destroy)
	
	data['tower'][str(tower_placement_id)]['id'] = tower_id
	data['tower'][str(tower_placement_id)]['name'] = tower.name
	data['resource'] -= config.menu[tower_id]['price']
	$CanvasLayer/GameStats.set_resource(data['resource'])

func on_tower_destroy(tower_placement_id):
	data['tower'].erase(str(tower_placement_id))

func on_enemy_entered_base(enemy):
	data['health'] -= enemy.damage
	$CanvasLayer/GameStats.set_damage(enemy.damage)
	
	if data['health'] < 1:
		print("Game Over")
		
func on_enemy_reward(value: int):
	data['resource'] += value
	$CanvasLayer/GameStats.set_resource(data['resource'])