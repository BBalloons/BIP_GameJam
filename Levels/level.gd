extends Node3D
@onready var node_3d: Node3D = $"Base Level/Node3D"
@onready var player: CharacterBody3D = $Player

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cam_left"):
		node_3d.rotation.y -= PI/2
		player.rotation.y -= PI/2
	if Input.is_action_just_pressed("cam_right"):
		node_3d.rotation.y += PI/2
		player.rotation.y += PI/2
