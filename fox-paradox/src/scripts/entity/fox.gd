extends CharacterBody2D
class_name Fox

const SPEED = 300.0
const JUMP_VELOCITY = -1000.0

enum State{READY, STOPED}
var current_state

var has_object_in_hand : bool = false

func _ready() -> void:
	current_state = State.READY

func _physics_process(delta: float) -> void:
	if current_state != State.STOPED:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		walk()
		move_and_slide()

func walk():
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		$AnimatedSprite2D.flip_h = (direction == -1)
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")
		
func stop(stop: bool):
	if stop:
		current_state = State.STOPED
		$AnimatedSprite2D.stop()
	else:
		current_state = State.READY
	
