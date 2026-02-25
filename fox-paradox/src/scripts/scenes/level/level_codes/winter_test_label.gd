extends Label

var code = ""
var code_index = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var password = PasswordGenerator.passes[3]
	for number in password:
		code += str(number)
	self.text = "Your Password is " + code
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
