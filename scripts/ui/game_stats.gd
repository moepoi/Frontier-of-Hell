extends Control

signal on_paused()
signal on_fast_forward()

var is_active: bool = false

func set_resource(value):
	$Resources/Label.text = str(value)

func set_damage(value):
	var health = $Health/GridContainer.get_children()
	
	for x in range(value):
		if !health.is_empty():
			health[len(health) - 1].queue_free()
			health.pop_back()

func _on_pause_button_pressed():
	on_paused.emit()

func _on_pause_button_hold():
	$Pause/PauseButton.modulate = Color(0.615686, 0.615686, 0.615686, 1)

func _on_pause_button_release():
	$Pause/PauseButton.modulate = Color(1, 1, 1, 1)

func _on_fast_forward_button_pressed():
	if is_active:
		$FastForward/FastForwardButton.set_texture_normal(load("res://assets/icons/fast-forward.png"))
		is_active = false
	else:
		$FastForward/FastForwardButton.set_texture_normal(load("res://assets/icons/fast-forward-active.png"))
		is_active = true

	on_fast_forward.emit()

func _on_fast_forward_button_hold():
	$FastForward/FastForwardButton.modulate = Color(0.615686, 0.615686, 0.615686, 1)

func _on_fast_forward_button_release():
	$FastForward/FastForwardButton.modulate = Color(1, 1, 1, 1)