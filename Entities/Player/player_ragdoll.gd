extends State

func Enter():
	pass

func Physics_Update(_delta: float):
	if Input.is_action_just_pressed("shift"):
		Transition.emit("Haunted")

func Exit():
	pass
