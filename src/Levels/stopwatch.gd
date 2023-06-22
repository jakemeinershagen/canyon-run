extends Node

@onready var timeElapsed: float = 0.00
var isRunning: bool = false


func _process(delta: float) -> void:
	# if you need to stop timer, change RaceData State
	isRunning = RaceData.raceRunning
	
	# I wanted to toggle isRunning in the toggle_pause function
	# of RaceData but that meant if you paused before starting
	# the race, pauseing the game actually started the stopwatch
	if isRunning && !RaceData.gamePaused:
		timeElapsed += delta

func getTimeString():
	var minutes = floor(timeElapsed / 60)
	var seconds = int(timeElapsed) % 60
	var milliseconds = int(timeElapsed * 1000) % 1000
	return "%02d:%02d:%03d" % [minutes, seconds, milliseconds]
