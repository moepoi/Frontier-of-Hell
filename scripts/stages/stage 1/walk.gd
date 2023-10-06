extends PathFollow2D

@export var speed = 30

func _ready():
	var rng = RandomNumberGenerator.new()
	set_v_offset(rng.randf_range(-30.0, 30.0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_progress(get_progress() + speed * delta)
