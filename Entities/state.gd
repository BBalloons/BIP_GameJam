extends Node
class_name State

signal Transition(state: Node, new_state: String)
func Enter():
	pass

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass
