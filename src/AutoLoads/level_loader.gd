extends Node

var levelPath: String = "res://src/Levels/level.tscn"


func restart_level() -> void:
	get_tree().change_scene_to_file(levelPath)
