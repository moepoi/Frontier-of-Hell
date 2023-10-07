extends Control


func set_resource(value):
	$Resources/Label.text = str(value)

func set_damage(value):
	var health = $Health/GridContainer.get_children()
	
	for x in range(value):
		if !health.is_empty():
			health[len(health) - 1].queue_free()
			health.pop_back()
