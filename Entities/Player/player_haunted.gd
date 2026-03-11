extends State

@export var player: CharacterBody3D


var target_pos: Vector3 = Vector3.ZERO
var SPEED: float = 4.0
var is_moving: bool = false

func Enter():
	target_pos = player.global_position

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	if Input.is_action_just_pressed("shift"):
		Transition.emit("Ragdoll")
	if is_moving:
		_move(_delta)
	else:
		if Input.is_action_pressed("up") and !%up.is_colliding():
			target_pos = player.global_position + player.transform.basis * Vector3(0, 0, -1)
			is_moving = true
		elif Input.is_action_pressed("down") and !%down.is_colliding():
			target_pos = player.global_position + player.transform.basis * Vector3(0, 0, 1)
			is_moving = true
		elif Input.is_action_pressed("left") and !%left.is_colliding():
			target_pos = player.global_position + player.transform.basis * Vector3(-1, 0, 0)
			is_moving = true
		elif Input.is_action_pressed("right") and !%right.is_colliding():
			target_pos = player.global_position + player.transform.basis * Vector3(1, 0, 0)
			is_moving = true

func _move(delta: float):
	player.global_position = player.global_position.move_toward(target_pos, SPEED * delta)
	if player.global_position.is_equal_approx(target_pos):
		player.global_position = target_pos
		is_moving = false

func Exit():
	pass
