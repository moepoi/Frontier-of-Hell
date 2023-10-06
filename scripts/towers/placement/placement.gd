extends StaticBody2D


signal on_placement(pos: Vector2, tower_placement_id: int)

func _on_input_event(_viewport, event, _shape_idx):
	var mouse_click = event as InputEventMouseButton
	if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
		on_placement.emit(global_position, get_instance_id())
