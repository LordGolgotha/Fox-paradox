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

var correct_code: String = "1234"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_labels()
	
func reset_labels():
	label_code.text = ""
	label_verified.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_x_pressed() -> void:
	self.queue_free()
	
func button_pressed(code: String = ""):
	if len(label_code.text) == 4:
		reset_labels()
	label_code.text += code
	if len(label_code.text) == 4:
		check_code()

func check_code():
	if label_code.text == correct_code:
		label_verified.text = "✅"
		
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
