extends Level

@onready var enter_code: Control = $EnterCode
@onready var code_typer: Code_Typer = $code_typer
@onready var label: Label = $Label
@onready var fox: Fox = $fox



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	code_typer.entercode.connect(triggermenu)
	enter_code.code_succeed.connect(solve)
	enter_code.menu_exited.connect(unlock)
	
func unlock():
	fox.stop(false)
	
func solve():
	label.visible = true
	unlock()
	code_typer.finish()

func triggermenu(index):
	enter_code.set_visibility(true)
	fox.stop(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
