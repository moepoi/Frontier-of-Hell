extends Control


var game_data = load("res://scripts/data/data.gd").new()
var data = game_data.load_data()

func _ready():
	match int(data['unlocked_stage']):
		1:
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer/Locked.hide()
		2:
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer2/Locked.hide()
		3:
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer2/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer3/Locked.hide()
		4:
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer2/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer3/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer3/MarginContainer/Locked.hide()
		5:
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer2/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer3/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer3/MarginContainer/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer3/MarginContainer2/Locked.hide()
		6:
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer2/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer2/MarginContainer3/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer3/MarginContainer/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer3/MarginContainer2/Locked.hide()
			$Panel/MarginContainer/VBoxContainer/HBoxContainer3/MarginContainer3/Locked.hide()
		_:
			pass

    # Check BGM Status
	if Global.bgm_status:
		$AudioStreamPlayer.play()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func _on_stage_1_pressed():
	verify_selected_stage(1)

func _on_stage_2_pressed():
	verify_selected_stage(2)

func _on_stage_3_pressed():
	verify_selected_stage(3)

func _on_stage_4_pressed():
	verify_selected_stage(4)

func _on_stage_5_pressed():
	verify_selected_stage(5)

func _on_stage_6_pressed():
	verify_selected_stage(6)

func verify_selected_stage(stage_id: int):
	if int(data['unlocked_stage']) >= stage_id:
		get_tree().change_scene_to_file("res://scenes/stages/stage_{stage_id}.tscn".format({"stage_id": str(stage_id)}))
	pass