extends CharacterBody2D

@export var health : int = 100

func _process(delta):
	update_healthbar()
	if health <= 0:
		queue_free()
		
func update_healthbar():
	$HealthBar.value = health
	
	if health >= 100:
		$HealthBar.visible = false
	else:
		$HealthBar.visible = true

func hit(damage : int):
	health = health - damage
