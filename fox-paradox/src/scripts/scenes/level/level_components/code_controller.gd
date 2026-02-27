extends Node2D
class_name CodeController

func on_succeed():
	$"../StaticBody2D2/Log".visible = true
	$"../StaticBody2D2/CollisionShape2D".disabled = false
