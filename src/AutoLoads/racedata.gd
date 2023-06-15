extends Node

var startLaps: int = -1

var raceRunning: bool = false
var numLaps: int = 0
var currLaps: int = startLaps

func set_race(newLaps: int) -> void:
	numLaps = newLaps
	currLaps = startLaps
	raceRunning = false

func add_lap() -> void:
	if !raceRunning and currLaps < numLaps:
		raceRunning = true
		currLaps += 1
	elif raceRunning and currLaps < numLaps:
		currLaps += 1
	if raceRunning and currLaps == numLaps:
		raceRunning = false