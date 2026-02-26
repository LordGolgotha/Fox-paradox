extends CharacterBody2D

class_name Hive

@export var jar_spot : JarSpot
@export var hive_size : String


func drop_honey():
	# TODO: Play animation and sounds
	if jar_spot.jar_in != null:
		jar_spot.jar_in.add_in_jar(hive_size)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Rock:
		body.queue_free()
		drop_honey()
