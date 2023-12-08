extends Node

var levelPath: String = "res://src/Levels/level.tscn"

var configPath: String = "user://level1.cfg"
var config: ConfigFile = ConfigFile.new()


func start_level() -> void:
	get_tree().change_scene_to_file(levelPath)
	LevelLoader.load_game()


func save_game() -> void:
	config.set_value("LevelInfo", "fastestTime", RaceData.fastestTime)
	
	# following line will print where data is saved
	#print(ProjectSettings.globalize_path(configPath))
	config.save(configPath)


func load_game() -> void:
	var err = config.load(configPath)
	
	if err != OK:
		# not sure if this should be warning or error. for now it doesn't
		# break things so I'll leave as warning
		# https://docs.godotengine.org/en/latest/classes/class_@globalscope.html#enum-globalscope-error
		push_warning("Could not load level save file: error code ", err\
				," path: ", ProjectSettings.globalize_path(configPath))
		return
	
	RaceData.fastestTime = config.get_value("LevelInfo", "fastestTime")
