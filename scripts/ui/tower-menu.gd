extends Control


var config = load("res://scripts/stages/stage 1/Config.gd").new()

signal build_tower(pos, tower_id, tower_placement_id)

var current_pos: Vector2 = Vector2(0,0)
var current_tower_id: int = 0
var current_tower_id_2: int = 1
var current_tower_placement_id = 0
var current_disabled = false
var current_disabled_2 = false

func _ready():
	hide()

func _process(delta):
	pass

func _on_close_pressed():
	hide()

func _on_tower_option_pressed():
	if !current_disabled:
		build_tower.emit(current_pos, current_tower_id, current_tower_placement_id)
		hide()

func _on_tower_option_2_pressed():
	if !current_disabled_2:
		build_tower.emit(current_pos, current_tower_id_2, current_tower_placement_id)
		hide()

func show_menu(tower_id, pos, tower_placement_id, disabled, disabled_2):
	current_pos = pos
	current_tower_placement_id = tower_placement_id
	current_tower_id = 0
	current_tower_id_2 = 1
	current_disabled = disabled
	current_disabled_2 = disabled_2
	
	if tower_id != null:
		current_tower_id = tower_id
		
		$Panel/VBoxContainer/Middle/TowerOption2.hide()
		$Panel/VBoxContainer/Bottom/TowerName2.hide()
		$Panel/VBoxContainer/Nether/TowerPrice2.hide()
	else:
		$Panel/VBoxContainer/Middle/TowerOption2.show()
		$Panel/VBoxContainer/Bottom/TowerName2.show()
		$Panel/VBoxContainer/Nether/TowerPrice2.show()
		
	var image = config.menu[current_tower_id]['image']
	if current_disabled:
		image = config.menu[current_tower_id]['image_disabled']
	
	$Panel/VBoxContainer/Middle/TowerOption.set_texture_normal(image)
	$Panel/VBoxContainer/Bottom/TowerName.text = config.menu[current_tower_id]['name']
	$Panel/VBoxContainer/Nether/TowerPrice.text = str(config.menu[current_tower_id]['price'])
	
	var image_2 = config.menu[current_tower_id_2]['image']
	if current_disabled_2:
		image_2 = config.menu[current_tower_id_2]['image_disabled']
	
	$Panel/VBoxContainer/Middle/TowerOption2.set_texture_normal(image_2)
	$Panel/VBoxContainer/Bottom/TowerName2.text = config.menu[current_tower_id_2]['name']
	$Panel/VBoxContainer/Nether/TowerPrice2.text = str(config.menu[current_tower_id_2]['price'])
		
	show()
