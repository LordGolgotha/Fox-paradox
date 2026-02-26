extends CodeController

func on_succeed():
	$"../obstacle".queue_free()
