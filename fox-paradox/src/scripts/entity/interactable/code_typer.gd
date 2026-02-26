extends Interactable
class_name Code_Typer

signal entercode(index)
@export var code_index:int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	if Input.is_action_just_pressed("Interact"):
		if current_state == State.IN:
			entercode.emit(code_index)

func set_code_index(index: int):
	code_index = index
