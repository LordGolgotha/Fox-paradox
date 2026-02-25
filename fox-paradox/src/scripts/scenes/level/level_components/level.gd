extends Node2D
class_name Level

@export var bounds:Array[Bound]

@export var id:String

@export var player:Fox

func _ready():
	for b in bounds:
		b.player_entered.connect(go_to_level)

func go_to_level(id_level:String):
	print("changing to level" + id_level)
