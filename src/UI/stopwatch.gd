extends Node

signal race_data_times_updated

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
	elif !isRunning && RaceData.raceOver:
		_on_race_over()


func getTimeString():
	var minutes = floor(timeElapsed / 60)
	var seconds = int(timeElapsed) % 60
	var milliseconds = int(timeElapsed * 1000) % 1000
	return "%02d:%02d:%03d" % [minutes, seconds, milliseconds]


func _on_race_over():
	RaceData.currentTime = timeElapsed
	if timeElapsed < RaceData.fastestTime:
		RaceData.fastestTime = timeElapsed
	emit_signal("race_data_times_updated")
