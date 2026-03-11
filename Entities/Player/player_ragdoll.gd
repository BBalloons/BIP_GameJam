extends State

@export var player: CharacterBody3D
const GHOST = preload("uid://cinxona0w0v1x")
var player_overlapping: bool = false
var ghost_body: CharacterBody3D
var instance

func Enter():
	instance = GHOST.instantiate()
	get_tree().current_scene.add_child(instance)
	instance.global_position = player.global_position
	
func Physics_Update(_delta: float):
	if player_overlapping and Input.is_action_just_pressed("shift"):
		Transition.emit("Haunted")

func Exit():
	player_overlapping = false
	instance = null
	ghost_body.queue_free()

func _ghost_entered(body: CharacterBody3D) -> void:
	ghost_body = body
	player_overlapping = true

func _ghost_exited(body: Node3D) -> void:
	player_overlapping = false
