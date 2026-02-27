extends Node

@onready var seed_vbox : VBoxContainer = $SeedVBox
@onready var summer_winter_vbox : VBoxContainer = $SummerWinterVBox
@onready var seed_line_edit : LineEdit = $SeedVBox/SeedLineEdit
@onready var error_label : Label = $SeedVBox/ErrorLabel

func _on_summer_button_button_down() -> void:
	GameManager.go_to_level("tuto_summer")
	MusicHandler.summer_music_start()
	
func _on_winter_button_button_down() -> void:
	GameManager.go_to_level("tuto_winter")
	MusicHandler.winter_music_start()
	
func _on_quit_button_button_down() -> void:
	get_tree().quit() 

func _on_confirm_seed_button_button_down() -> void:
	if seed_line_edit.text.is_empty():
		error_label.text = "You must enter a seed"
	else:
		PasswordGenerator.generate_passes(seed_line_edit.text)
		error_label.text = ""
		seed_vbox.visible = false
		summer_winter_vbox.visible = true
		
func _on_back_button_button_down() -> void:
	seed_vbox.visible = true
	summer_winter_vbox.visible = false
