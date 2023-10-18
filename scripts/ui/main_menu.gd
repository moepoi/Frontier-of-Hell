extends Control


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/select_stage.tscn")

func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/how_to_play.tscn")

func _on_about_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/about.tscn")

func _on_exit_pressed():
	get_tree().quit()