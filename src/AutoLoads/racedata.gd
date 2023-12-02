extends Node

var startLaps: int = -1
var fastestTime: float = 999.999
var currentTime: float = 0.0

var raceRunning: bool = false
var raceOver: bool = false
var gamePaused: bool = false

var numLaps: int = 0
var currLaps: int = startLaps

func set_race(newLaps: int) -> void:
	numLaps = newLaps
	currLaps = startLaps
	raceRunning = false
	raceOver = false

func add_lap() -> void:
	if !raceRunning and currLaps < numLaps:
		raceRunning = true
		currLaps += 1
	elif raceRunning and currLaps < numLaps:
		currLaps += 1
		if currLaps == numLaps:
			raceRunning = false
			raceOver = true

func remove_lap() -> void:
	if currLaps == 0:
		currLaps = 0
	elif currLaps > 0:
		currLaps -= 1

func toggle_pause() -> void:
	gamePaused = !gamePaused

func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()
