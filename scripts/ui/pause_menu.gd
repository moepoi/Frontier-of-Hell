extends Control

signal on_resume()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_menu():
	show()

func hide_menu():
	hide()

func _on_resume_button_pressed():
	on_resume.emit()