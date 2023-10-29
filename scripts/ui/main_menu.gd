extends Control


var game_data = load("res://scripts/data/data.gd").new()
var data = game_data.load_data()

@onready var timer = $Timer

var debug_state = 0

func _ready():
	if data == null:
		game_data.save_data({
			"debug": false,
			"unlocked_stage": 1
		})

func _on_logo_pressed():
	if timer.is_stopped():
		timer.start()

	debug_state += 1

	if debug_state >= 6:
		if data['debug']:
			game_data.save_data({
				"debug": false,
				"unlocked_stage": 1
			})
		else:
			game_data.save_data({
				"debug": true,
				"unlocked_stage": 6
			})

func _on_timer_timeout():
	debug_state = 0

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/select_stage.tscn")

func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/how_to_play.tscn")

func _on_about_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/about.tscn")

func _on_exit_pressed():
	get_tree().quit()