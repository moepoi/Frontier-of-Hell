extends Control

signal on_resume()

func show_menu():
	show()

func hide_menu():
	hide()

func _on_resume_button_pressed():
	on_resume.emit()

func _on_resume_hold():
	$Panel/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Resume.modulate = Color(0.541176, 0.541176, 0.541176, 1)

func _on_resume_release():
	$Panel/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Resume.modulate = Color(1, 1, 1, 1)

func _on_main_menu_pressed():
	on_resume.emit()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func _on_main_menu_hold():
	$Panel/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/MainMenu.modulate = Color(0.541176, 0.541176, 0.541176, 1)

func _on_main_menu_release():
	$Panel/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/MainMenu.modulate = Color(1, 1, 1, 1)