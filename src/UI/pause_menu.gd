extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	RaceData.connect("game_paused", _on_game_paused)
	RaceData.connect("game_unpaused", _on_game_unpaused)

func _on_game_paused():
	visible = true

func _on_game_unpaused():
	visible = false
