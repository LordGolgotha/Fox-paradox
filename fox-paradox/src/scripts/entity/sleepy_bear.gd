extends CharacterBody2D

@export var controller : CodeControllerBearWinter
@onready var sprite : Sprite2D = $Sprite2D

func _ready() -> void:
	controller.succeed.connect(wake_up)
	
func wake_up() -> void:
	sprite.texture = load("res://assets/bear.png")
	set_collision_layer_value(1,false)
	
