extends Area2D
class_name Interactable

@onready var notification: Sprite2D = $Notification

enum State{IN, OUT, DONE, PAUSE}
var current_state = State.OUT
var old_state = State.OUT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	notification.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if current_state != State.DONE:
		notification.visible = true
		current_state = State.IN


func _on_body_exited(body: Node2D) -> void:
	if current_state != State.DONE and current_state != State.PAUSE:
		notification.visible = false
		current_state = State.OUT
	
func finish():
	notification.visible = false
	current_state = State.DONE
	
func pause():
	old_state = current_state
	current_state = State.PAUSE

func unpause():
	current_state = old_state
