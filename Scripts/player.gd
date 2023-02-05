extends KinematicBody


# Declare member variables here.
var melee_damage = 50
# How fast the player moves in meters per second.
export var speed : int = 10
export var acceleration : int = 5


var mouse_sensitivity = 0.1

var direction = Vector3()
var velocity = Vector3()

onready var pivot = $Head

onready var melee_anim= $AnimationPlayer
onready var hitbox = $Head/Camera/HitBox


func _ready():

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
	
func _input(event):
	if event is InputEventMouseMotion: #Takes in the mouse motion and moves mesh and camera with the movement
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		pivot.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		pivot.rotation.x = clamp(pivot.rotation.x, deg2rad(-90), deg2rad(90))
		
func melee():	
	if Input.is_action_just_pressed("fire"):
		if not melee_anim.is_playing():
			melee_anim.play("attack")
			melee_anim.queue("Return")
			
		if melee_anim.current_animation == "attack":
			for body in hitbox.get_overlapping_bodies():
				if body.is_in_group("Enemy"):
					body.health -= melee_damage


func _physics_process(delta):
	melee()
	
	direction = Vector3()
	
	if Input.is_action_just_pressed("ui_cancel"): #Bug, dosent find the function.
		Input.set_mouse_model(Input.MOUSE_MODE_VISIBLE)
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("move_back"):
		direction += transform.basis.z

	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x



	direction = direction.normalized()
	velocity = direction * speed
	velocity.linear_interpolate(velocity, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
