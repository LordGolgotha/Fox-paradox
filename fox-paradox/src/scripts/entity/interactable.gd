extends Area2D
class_name Interactable

@onready var notification: Label = $Notification

enum State{IN, OUT}
var current_state = State.OUT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	notification.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Fox:
		notification.visible = true
		current_state = State.IN
		print("IN")


func _on_body_exited(body: Node2D) -> void:
	notification.visible = false
	current_state = State.OUT
	print("OUT")
	
