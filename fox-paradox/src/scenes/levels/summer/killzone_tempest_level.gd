extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("qq")
	if body is Fox:
		$"../fox_winter".global_position = $"../spawn".global_position
