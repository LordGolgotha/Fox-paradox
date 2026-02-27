extends Node
class_name PauseMenu

var pause : bool = false
@onready var resume_button: Button = $PauseVBox/ResumeButton
signal stop()
signal unstop()

func pause_unpause() -> void:
	print_debug("pause / unpause")
	pause = !pause
	
	if pause:
		get_tree().paused = true
		self.visible = true
		resume_button.grab_focus.call_deferred()
		stop.emit()
	else:
		get_tree().paused = false
		self.visible = false
		unstop.emit()
	
	
func _on_quit_button_button_down() -> void:
	print_debug("quit")
	get_tree().quit() 

func _input(event):
	if event.is_action_pressed("pause"):
		pause_unpause()
