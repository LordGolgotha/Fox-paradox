extends Area2D

@export var menu_to_display : PaperMenu
@export var label : Label

var player_in : bool = false

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("Interact") and player_in:
		menu_to_display.visible = true
		label.visible = false
	if event.is_action_released("Interact"):
		menu_to_display.visible = false
		if player_in:
			label.visible = true

func _on_body_entered(body: Node2D) -> void:
	if body is Fox:
		player_in = true
		label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is Fox:
		player_in = false
		label.visible = false
