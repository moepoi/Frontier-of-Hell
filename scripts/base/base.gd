extends Area2D

signal enemy_entered_base(enemy)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		var enemy = body.get_parent()
		enemy_entered_base.emit(enemy)
		body.get_parent().destroy()
