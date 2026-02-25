extends Node

var pause : bool = false

func pause_unpause() -> void:
	print_debug("pause / unpause")
	pause = !pause
	
	if pause:
		get_tree().paused = true
		self.visible = true
	else:
		get_tree().paused = false
		self.visible = false
	
func _on_quit_button_button_down() -> void:
	print_debug("quit")
	get_tree().quit() 

func _input(event):
	if event.is_action_pressed("pause"):
		pause_unpause()
