extends Area2D

signal enemy_entered_base(enemy)

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		var enemy = body.get_parent()
		enemy_entered_base.emit(enemy)
		body.get_parent().destroy()
