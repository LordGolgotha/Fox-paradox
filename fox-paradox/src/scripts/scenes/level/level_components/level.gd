extends Node2D
class_name Level

@export var bounds:Array[Bound]

@export var id:String

func go_to_level(id_level:String):
	get_tree().change_scene_to_file(id_level)
