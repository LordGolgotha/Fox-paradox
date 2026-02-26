extends Control

@onready var button_x: Button = $Button/Button_X
@onready var button_0: Button = $Button/Button_0
@onready var button_3: Button = $Button/Button_3
@onready var button_1: Button = $Button/Button_1
@onready var button_4: Button = $Button/Button_4
@onready var button_2: Button = $Button/Button_2
@onready var button_5: Button = $Button/Button_5

const GLYPHE_1 = preload("uid://bhi7t566gowmc")
const GLYPHE_2 = preload("uid://b2rbcxa58q6g1")
const GLYPHE_3 = preload("uid://l5wnsdf5qdt7")
const GLYPHE_4 = preload("uid://gtn8xpd1e734")
const GLYPHE_5 = preload("uid://d1pnyt42tpvvl")
const GLYPHE_6 = preload("uid://wp558goj7j75")

const number_to_glyph: Dictionary = {"0": GLYPHE_1, "1": GLYPHE_2, "2": GLYPHE_3, "3": GLYPHE_4, "4": GLYPHE_5, "5": GLYPHE_6}
const glyph_to_number: Dictionary = {GLYPHE_1: "0", GLYPHE_2: "1", GLYPHE_3: "2", GLYPHE_4: "3", GLYPHE_5: "4", GLYPHE_6: "5"}
var buttons

@onready var label_code: Label = $Labels/Label_code
@onready var label_verified: Label = $Labels/Label_verified

signal code_succeed()
signal menu_exited()

@export var code_index: int = 3
var correct_code: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buttons = [button_0, button_1, button_2, button_3, button_4, button_5]
	reset_labels()
	var password = PasswordGenerator.passes[code_index]
	for number in password:
		correct_code += str(number)
	for button in buttons:
		button.icon = number_to_glyph[button.text]
		button.text = ""
		button.expand_icon = true
		button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	set_visibility(false)
	
func reset_labels():
	label_code.text = ""
	label_verified.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Cancel"):
		_on_button_x_pressed()

func _on_button_x_pressed() -> void:
	set_visibility(false)
	menu_exited.emit()
	
func button_pressed(code: String = ""):
	if len(label_code.text) == 4:
		reset_labels()
	label_code.text += code
	if len(label_code.text) == 4:
		check_code()

func check_code():
	if label_code.text == correct_code:
		label_verified.text = "✅"
		await get_tree().create_timer(1).timeout
		code_succeed.emit()
		set_visibility(false)
		
		
func set_corect_code(code: String = "0000"):
	correct_code = code
	
func _on_button_0_pressed() -> void:
	button_pressed("0")
	
func _on_button_1_pressed() -> void:
	button_pressed("1")
	
func _on_button_2_pressed() -> void:
	button_pressed("2")

func _on_button_3_pressed() -> void:
	button_pressed("3")

func _on_button_4_pressed() -> void:
	button_pressed("4")

func _on_button_5_pressed() -> void:
	button_pressed("5")
	
func set_visibility(visibility: bool):
	button_x.visible = visibility
	for i in range(buttons.size()):
		buttons[i].visible = visibility
	label_code.visible = visibility
	label_verified.visible = visibility
