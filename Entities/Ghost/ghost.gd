extends CharacterBody3D

var target_pos: Vector3 = Vector3.ZERO
var SPEED: float = 4.0
var is_moving: bool = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shift"):
		queue_free()
	if is_moving:
		_move(delta)
	else:
		if Input.is_action_pressed("up"):
			target_pos = global_position + Vector3(0, 0, -1)* global_transform.basis
			is_moving = true
		elif Input.is_action_pressed("down"):
			target_pos = global_position + Vector3(0, 0, 1)* global_transform.basis
			is_moving = true
		elif Input.is_action_pressed("left"):
			target_pos = global_position + Vector3(-1, 0, 0)* global_transform.basis
			is_moving = true
		elif Input.is_action_pressed("right"):
			target_pos = global_position + Vector3(1, 0, 0)* global_transform.basis
			is_moving = true

func _move(delta: float):
	global_position = global_position.move_toward(target_pos, SPEED * delta)
	if global_position.is_equal_approx(target_pos):
		global_position = target_pos
		is_moving = false
