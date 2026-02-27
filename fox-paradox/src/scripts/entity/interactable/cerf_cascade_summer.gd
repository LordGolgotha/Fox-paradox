extends Node2D

@onready var inside:bool = false

func _ready():
	pass

func _process(delta):
	if inside:
		if Input.is_action_just_pressed("Interact"):
			$"../glyphes".visible = true
			$AudioStreamPlayer.play()
	
func enter(body:Node2D):
	if body is Fox:
		inside = true

func exit(body:Node2D):
	if body is Fox:
		inside = false
