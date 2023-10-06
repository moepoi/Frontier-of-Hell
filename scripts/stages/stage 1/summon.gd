extends Path2D

var timer = 0
@export var spawnTime = 3
var spawn_first: bool = true

@export var enemy: PackedScene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	
	if spawn_first:
		add_child(enemy.instantiate())
		spawn_first = false
	
	if timer > spawnTime:
		add_child(enemy.instantiate())
		timer = 0
