extends CharacterBody2D

class_name HoldableObject

var is_grabbed : bool = false
var can_be_grabbed : bool = false
var grabber : Fox
const GRAVITY = 200.0

signal dropped

func _physics_process(delta):
	if not is_on_floor() and not is_grabbed:
		velocity += get_gravity() * delta
		
	if is_grabbed:
		global_position = grabber.position + Vector2(0,-10)
		
	move_and_slide()

func _input(event: InputEvent) -> void:
	if can_be_grabbed and event.is_action_pressed("interact"):
		is_grabbed = true
	elif can_be_grabbed and event.is_action_released("interact"):
		is_grabbed = false
		dropped.emit()
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Fox and not body.has_object_in_hand:
		grabber = body
		can_be_grabbed = true
		body.has_object_in_hand = true
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Fox:
		can_be_grabbed = false
	if body is Fox and body.has_object_in_hand:
		body.has_object_in_hand = false
		
