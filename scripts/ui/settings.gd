extends Control


var bus_master = AudioServer.get_bus_index("Master")

func _ready():
	$Panel/VolumeSlider.value = Global.sound_volume
	$Panel/BGMController.button_pressed = Global.bgm_status
	$Panel/SFXController.button_pressed = Global.sfx_status

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(bus_master, value)
	AudioServer.set_bus_mute(bus_master, value == $Panel/VolumeSlider.min_value)
	Global.sound_volume = value

func _on_bgm_controller_toggled(button_pressed):
	Global.bgm_status = button_pressed

func _on_sfx_controller_toggled(button_pressed):
	Global.sfx_status = button_pressed