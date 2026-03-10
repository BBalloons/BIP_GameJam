extends Node
@export var initial_state: State
var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	initial_state.Enter()
	current_state = initial_state
	for child in get_children():
		states[child.name.to_lower()] = child
		child.Transition.connect(on_transition)

func _process(delta: float) -> void:
	current_state.Update(delta)
func _physics_process(delta: float) -> void:
	current_state.Physics_Update(delta)

func on_transition(new_state_name):
	var new_state: State = states[new_state_name.to_lower()]
	
	current_state.Exit()
	new_state.Enter()
	current_state = new_state
