extends KinematicBody

onready var Camera = get_node("/root/Game/Player/Pivot/Camera")
onready var Pivot = get_node("/root/Game/Player/Pivot")

var velocity = Vector3()
var gravity = -9.8
var speed = 7
var max_speed = 9

var mouse_sensitivity = 0.002

var target = null

#func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(_delta):
	velocity.y += gravity * _delta
	var falling = velocity.y 
	velocity.y = 0
	
	var desired_velocity = get_input() * speed
	if desired_velocity.length():
		velocity +=desired_velocity
	else:
		velocity *= 0.9
	var current_speed = velocity.length()
	velocity = velocity.normalized() * clamp(current_speed, 0, max_speed)
	velocity.y = falling
	
	if not $AnimationPlayer.is_playing():
		$AnimationTree.active = true
		$AnimationTree.set("parameters/Idle_Run/blend_amount", current_speed/max_speed)
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
	if Input.is_action_just_pressed("shoot"):
		$AnimationTree.active = false
		$AnimationPlayer.play("Shoot")
		if target != null and target.is_in_group("target"):
			target.die()
	if global_transform.origin.y < -15:
		get_tree().change_scene("res://UI/Lose_Screen.tscn")
	if Global.timer < 0:
		get_tree().change_scene("res://UI/Lose_Screen.tscn")

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		Pivot.rotation_degrees.x = clamp(Pivot.rotation_degrees.x, -30, 15)


func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir -= Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir -= Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir

func damage(d):
	get_node("/root/Game/UI").add_damage(0.5)
	Global.update_score(-5)
	Global.decrease_health(d)
	if Global.health <=0:
		get_tree().change_scene("res://UI/Lose_Screen.tscn")


