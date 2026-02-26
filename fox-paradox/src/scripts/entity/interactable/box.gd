extends Interactable
class_name Box

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	if Input.is_action_just_pressed("ui_accept"):
		if current_state == State.IN:
			print("push")
