extends CharacterBody3D
const SPEED = 5.0
var direction: Vector2

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.y * SPEED
	else:
		velocity = Vector3.ZERO

	move_and_slide()
