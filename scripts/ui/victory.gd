extends Control


var next_stage: int = 0

func set_next_stage(value: int):
	if value != 0:
		next_stage = value
	else:
		$Panel/MarginContainer/VBoxContainer/NextStage.text = "Main Menu"

func _on_next_stage_pressed():
	get_tree().paused = false
	
	if next_stage != 0:
		get_tree().change_scene_to_file("res://scenes/stages/stage_{stage_id}.tscn".format({"stage_id": str(next_stage)}))
	else:
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")