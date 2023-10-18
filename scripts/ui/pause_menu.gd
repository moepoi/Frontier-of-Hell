extends Control

signal on_resume()

func show_menu():
	show()

func hide_menu():
	hide()

func _on_resume_button_pressed():
	on_resume.emit()

func _on_main_menu_pressed():
	on_resume.emit()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")