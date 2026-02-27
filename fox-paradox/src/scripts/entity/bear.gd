extends Area2D

class_name Bear

@export var rock_pos : Array[Vector2]
@export var jar_pos : Array[Vector2]

const JAR_SIZES : Array[String] = ["SMALL","MEDIUM","TALL"]

var jar_in : Jar
var nb_full_jar : int = 0

signal succeed

func _on_body_entered(body: Node2D) -> void:
	print_debug("bear")
	if body is Jar:
		jar_in = body
		if not jar_in.dropped.is_connected(receive_jar):
			jar_in.dropped.connect(receive_jar)
		
func _on_body_exited(body: Node2D) -> void:
	if body == jar_in:
		jar_in = null
			
func receive_full_jar() -> void:
	nb_full_jar += 1
	if nb_full_jar == 3:
		print_debug("Félicitations tu as réussi !")
		succeed.emit()
	
func reset() -> void:
	nb_full_jar = 0
	var jars = get_tree().get_nodes_in_group("jars")
	for i in jars.size():
		jars[i].queue_free()
	jars.clear()
	
	var rocks = get_tree().get_nodes_in_group("rocks")
	for i in rocks.size() :
		rocks[i].queue_free()
	rocks.clear()
	
		
	for i in range(5):
		var new_rock = preload("res://src/scenes/entity/rock.tscn").instantiate()
		rocks.append(new_rock)
		new_rock.global_position = rock_pos[i]
		new_rock.scale = Vector2(0.1,0.1)
		new_rock.add_to_group("rocks")
		add_sibling(new_rock)
		
	for i in range(3):
		var new_jar = preload("res://src/scenes/entity/jar.tscn").instantiate()
		jars.append(new_jar)
		new_jar.global_position = jar_pos[i]
		new_jar.scale = Vector2(0.25,0.25)
		new_jar.jar_size = JAR_SIZES[i]
		new_jar.add_to_group("jars")
		add_sibling(new_jar)
		
		
func receive_jar() -> void:
	if jar_in != null:
		match jar_in.jar_state:
			jar_in.State.EMPTY:
				print_debug("bah il y a rien là frérot")
				reset()
			jar_in.State.ALMOST_EMPTY:
				print_debug("pas assez de miel frérot")
				reset()
			jar_in.State.HALF_EMPTY:
				print_debug("pas mal mais tu peux mieux faire")			
				reset()
			jar_in.State.FULL:
				print_debug("parfait !")
				receive_full_jar() 
				jar_in.queue_free()
			jar_in.State.OVERFLOW:
				print_debug("tu déconnes là ça dégouline")
				reset()
