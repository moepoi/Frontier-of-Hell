extends Node2D

class_name GameManager

var config = load("res://scripts/stages/1/config.gd").new()

var data = {
	"tower": {},
	"health": 6,
	"resource": 100
}

func _ready():
	var placements = $Placements.get_children()
	for placement in placements:
		placement.connect("on_placement", on_game_placement)
	$CanvasLayer/TowerMenu.connect("build_tower", on_build_tower)

func _process(delta):
	pass
	
func on_game_placement(pos, tower_placement_id):
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
	print(data)

func on_build_tower(pos, tower_id, tower_placement_id):
	if data['tower'].has(str(tower_placement_id)):
		var current_tower = get_tree().current_scene.get_node(str(data['tower'][str(tower_placement_id)]['name']))
		current_tower.queue_free()
	else:
		data['tower'][str(tower_placement_id)] = {}
		
	var tower = config.tower[tower_id]['asset'].instantiate()
	get_tree().current_scene.add_child(tower)
	tower.global_position = pos
	
	data['tower'][str(tower_placement_id)]['id'] = tower_id
	data['tower'][str(tower_placement_id)]['name'] = tower.name
	data['resource'] -= config.menu[tower_id]['price']
