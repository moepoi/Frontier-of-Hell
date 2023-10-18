extends Control


func update_duration(time: float):
	$Duration/Label.text = "%d:%02d" % [floor(time / 60), int(time) % 60]