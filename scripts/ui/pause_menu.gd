extends Control

signal on_resume()

func show_menu():
	show()

func hide_menu():
	hide()

func _on_resume_button_pressed():
	on_resume.emit()