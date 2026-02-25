extends Level

@onready var enter_code: Control = $EnterCode
@onready var code_typer: Code_Typer = $code_typer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enter_code.visible = false
	code_typer.entercode.connect(triggermenu)

func triggermenu(index):
	enter_code.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
