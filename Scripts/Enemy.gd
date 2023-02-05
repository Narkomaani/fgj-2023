extends KinematicBody

export var health : int = 200

func _ready():
	add_to_group("Enemy")

func _process(delta):
	if health <= 0:
		print("Helloworld")
