extends CharacterBody3D

var target_pos: Vector3 = Vector3.ZERO
var SPEED: float = 8.0
var is_moving: bool = false

func _ready() -> void:
	var player = get_tree().get_first_node_in_group("player")
	rotation = player.rotation

func _physics_process(delta: float) -> void:
	if is_moving:
		_move(delta)
	else:
		if Input.is_action_pressed("up"):
			target_pos = global_position + transform.basis*Vector3(0, 0, -1)
			is_moving = true
		elif Input.is_action_pressed("down"):
			target_pos = global_position + transform.basis*Vector3(0, 0, 1)
			is_moving = true
		elif Input.is_action_pressed("left"):
			target_pos = global_position + transform.basis*Vector3(-1, 0, 0)
			is_moving = true
		elif Input.is_action_pressed("right"):
			target_pos = global_position + transform.basis*Vector3(1, 0, 0)
			is_moving = true
	if Input.is_action_just_pressed("cam_left"):
		rotation.y -= PI/2
	if Input.is_action_just_pressed("cam_right"):
		rotation.y += PI/2

func _move(delta: float):
	global_position = global_position.move_toward(target_pos, SPEED * delta)
	if global_position.is_equal_approx(target_pos):
		global_position = target_pos
		is_moving = false
