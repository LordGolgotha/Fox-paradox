extends Node2D
class_name Level

@export var bounds:Array[Bound]

@export var id:String

@export var fox:Fox

@export var enter_code: EnterCode

@export var code_controller: CodeController

@export var code_typer : Code_Typer

func _ready():
	for b in bounds:
		b.player_entered.connect(go_to_level)
	if code_typer != null and enter_code != null and code_controller != null:
		code_typer.entercode.connect(triggermenu)
		enter_code.code_succeed.connect(solve)
		enter_code.menu_exited.connect(unlock)
	
func unlock():
	fox.stop(false)
	
func solve():
	unlock()
	code_typer.finish()
	code_controller.on_succeed()

func triggermenu(index):
	enter_code.set_visibility(true)
	fox.stop(true)

func go_to_level(id_level:String):
	print("changing to level" + id_level)
	GameManager.go_to_level(id_level)
