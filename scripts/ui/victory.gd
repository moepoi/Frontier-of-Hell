extends Control


var game_data = load("res://scripts/data/data.gd").new()
var data = game_data.load_data()

var next_stage: int = 0

func set_next_stage(value: int):
	if value != 0:
		next_stage = value
	else:
		$Panel/MarginContainer/VBoxContainer/NextStage.text = "Main Menu"

func unlock_next_stage():
	if next_stage != 0:
		if data['unlocked_stage'] < next_stage:
			data['unlocked_stage'] = next_stage
			game_data.save_data(data)

func _on_next_stage_pressed():
	get_tree().paused = false
	
	if next_stage != 0:
		get_tree().change_scene_to_file("res://scenes/stages/stage_{stage_id}.tscn".format({"stage_id": str(next_stage)}))
	else:
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")