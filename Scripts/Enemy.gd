extends KinematicBody

var health = 500
var target

const TURN_SPEED = 0.5

onready var eyes = $Eyes
onready var raycast = $RayCast



func _on_SightRange_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		#set_color_red()

func _process(delta):

	if target:
		look_at(target.global_transform.origin, Vector3.UP)
		rotate_y(deg2rad(eyes.rotation.x * TURN_SPEED)) 
	if health <= 0:
		queue_free()
#func set_color_red():
#	$MeshInstance.get_surface_material(0).set_albedo(Color(1, 0, 0))
