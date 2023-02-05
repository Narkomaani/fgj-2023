extends KinematicBody

var health = 500
var target

const TURN_SPEED = 0.5

onready var eyes = $CollisionBody/Eyes
onready var raycast = $RayCast



func _on_SightRange_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		get_node(".")
		#set_color_red()

func _physics_process(_delta):

	if target:
		#look_at(target.global_transform.origin, Vector3.UP)
		#move_and_slide(target.global_transform.origin*.1, Vector3.UP)
		#rotate_y(deg2rad(eyes.rotation.x * TURN_SPEED))  
		#rotate_y(TURN_SPEED)
		var location = target.global_translation
		print(location)
		
		look_at(location, Vector3.UP)
		eyes.look_at(location, Vector3.UP)
		
		#move_and_collide(location * TURN_SPEED)
		
		pass
	if health <= 0:
		print("enemy dead")
		queue_free()
#func set_color_red():
#	$MeshInstance.get_surface_material(0).set_albedo(Color(1, 0, 0))
