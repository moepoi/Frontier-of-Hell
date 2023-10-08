extends Control

signal on_paused()

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