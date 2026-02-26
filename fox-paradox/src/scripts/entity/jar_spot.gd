extends Area2D

class_name JarSpot

var is_jar_in : bool = false
var jar_in : Jar = null

func _on_body_entered(body: Node2D) -> void:
	print_debug("body in")
	if body is Jar and not is_jar_in:
		print_debug("jar in")
		is_jar_in = true
		jar_in = body
		jar_in.dropped.connect(set_jar_pos)
		
func _on_body_exited(body: Node2D) -> void:
	if body == jar_in:
		print_debug("jar out")
		is_jar_in = false
		jar_in = null
		
func set_jar_pos() -> void:
	if jar_in != null:
		print_debug("jar pos")
		jar_in.global_position = global_position
