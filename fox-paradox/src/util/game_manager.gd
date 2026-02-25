extends Node

func go_to_level(id_level : String) -> void:
	get_tree().change_scene_to_file(LevelsControler.level_list[id_level])
