extends Node2D
class_name Level

@export var bounds:Array[Bound]

@export var id:String

@export var fox:Fox

@export var enter_code: EnterCode

@export var code_controller: CodeController

@export var code_typer : Code_Typer

@export var glyph_0 : Glyph
@export var glyph_1 : Glyph
@export var glyph_2 : Glyph
@export var glyph_3 : Glyph

@export var code_id: int = -1


func _ready():
	for b in bounds:
		b.player_entered.connect(go_to_level)
	if code_typer != null and enter_code != null and code_controller != null:
		code_typer.entercode.connect(triggermenu)
		enter_code.code_succeed.connect(solve)
		enter_code.menu_exited.connect(unlock)
		if code_id != -1 and code_id != null and code_id < len(PasswordGenerator.passes):
			enter_code.set_corect_code(code_id)
	if code_id != -1 and code_id != null and code_id < len(PasswordGenerator.passes):
		var password = PasswordGenerator.passes[code_id]
		if glyph_0 != null:
			glyph_0.set_glyph(str(password[0]))
		if glyph_1 != null:
			glyph_1.set_glyph(str(password[1]))
		if glyph_2 != null:
			glyph_2.set_glyph(str(password[2]))
		if glyph_3 != null:
			glyph_3.set_glyph(str(password[3]))
			
	
func unlock():
	code_typer.unpause()
	fox.stop(false)
	
func solve():
	unlock()
	code_typer.finish()
	code_controller.on_succeed()

func triggermenu(index):
	code_typer.pause()
	enter_code.set_visibility(true)
	fox.stop(true)

func go_to_level(id_level:String):
	print("changing to level" + id_level)
	GameManager.go_to_level(id_level)
