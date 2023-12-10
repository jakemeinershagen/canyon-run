extends Button

@export var trackName = "track1"

func _on_button_up() -> void:
	LevelLoader.start_level(trackName)
