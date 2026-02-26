extends Control

@onready var button_x: Button = $Button/Button_X
@onready var button_0: Button = $Button/Button_0
@onready var button_3: Button = $Button/Button_3
@onready var button_1: Button = $Button/Button_1
@onready var button_4: Button = $Button/Button_4
@onready var button_2: Button = $Button/Button_2
@onready var button_5: Button = $Button/Button_5


@onready var label_code: Label = $Labels/Label_code
@onready var label_verified: Label = $Labels/Label_verified

signal code_succeed()

var correct_code: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_labels()
	var password = PasswordGenerator.passes[3]
	for number in password:
		correct_code += str(number)
	set_visibility(false)
	
func reset_labels():
	label_code.text = ""
	label_verified.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_x_pressed() -> void:
	set_visibility(false)
	
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
	button_pressed(button_0.text)
	
func _on_button_1_pressed() -> void:
	button_pressed(button_1.text)

func _on_button_2_pressed() -> void:
	button_pressed(button_2.text)

func _on_button_3_pressed() -> void:
	button_pressed(button_3.text)

func _on_button_4_pressed() -> void:
	button_pressed(button_4.text)

func _on_button_5_pressed() -> void:
	button_pressed(button_5.text)
	
func set_visibility(visibility: bool):
	button_x.visible = visibility
	button_0.visible = visibility
	button_1.visible = visibility
	button_2.visible = visibility
	button_3.visible = visibility
	button_4.visible = visibility
	button_5.visible = visibility
	label_code.visible = visibility
	label_verified.visible = visibility
