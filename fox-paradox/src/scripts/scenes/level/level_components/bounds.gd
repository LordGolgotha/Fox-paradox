extends Area2D
class_name Bound

@export var to_screen: String

signal player_entered(new_level)
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	print("bonjour")
	if body is Fox:
		player_entered.emit(to_screen)
