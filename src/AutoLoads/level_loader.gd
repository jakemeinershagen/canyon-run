extends Node

var levelPath: String = "res://src/Levels/level.tscn"
var trackPath: String = "res://src/Tracks/"

var configPath: String = "user://"
var config: ConfigFile = ConfigFile.new()


func start_level(trackName: String) -> void:
	get_tree().change_scene_to_file(levelPath)
	
	trackPath += trackName + ".tscn"
	var trackScene = load(trackPath)
	var trackInstance = trackScene.instantiate()
	get_tree().root.add_child(trackInstance)
	
	configPath += trackName + ".cfg"
	LevelLoader.load_game()


func restart_level() -> void:
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
		push_warning("Could not load track save file: error code ", err\
				," path: ", ProjectSettings.globalize_path(configPath))
		return
	
	RaceData.fastestTime = config.get_value("LevelInfo", "fastestTime")
