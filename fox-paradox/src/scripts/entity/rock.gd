extends HoldableObject

class_name Rock

func _input(event: InputEvent) -> void:
	super(event)
	if event.is_action_pressed("throw_test") and is_grabbed:
		throw()

func throw():
	is_grabbed = false
	velocity.y = -1000
