extends Node


@export var direction = "right"

func _ready():
	match direction:
		"up":
			$up.visible = true
		"down":
			$down.visible = true
		"left":
			$left.visible = true
		"right":
			$right.visible = true
		_:
			$right.visible = true

func _on_timer_timeout():
	queue_free()