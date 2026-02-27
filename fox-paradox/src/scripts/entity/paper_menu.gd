extends Control

class_name PaperMenu

@export var text : String
@onready var label : Label = $TextureRect/Label

func _ready() -> void:
	label.text = text
