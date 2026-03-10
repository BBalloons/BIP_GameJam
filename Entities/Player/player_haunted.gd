extends State
@export var player: CharacterBody3D
const SPEED = 5.0
var direction: Vector2

func Enter():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	if Input.is_action_just_pressed("shift"):
		Exit()
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		player.velocity.x = direction.x * SPEED
		player.velocity.z = direction.y * SPEED
	else:
		player.velocity = Vector3.ZERO

func Exit():
	pass
