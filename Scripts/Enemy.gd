extends KinematicBody

export var health : int = 200

func _ready():
	add_to_group("Enemy")

func _process(body):
	if health <= 0:
		queue_free()
