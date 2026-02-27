extends CodeController

class_name CodeControllerBearWinter

signal succeed

func on_succeed():
	succeed.emit()
