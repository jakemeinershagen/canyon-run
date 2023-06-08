extends Node

var startLaps: int = -1

var raceRunning: bool = false
var numLaps: int = 0
var currLaps: int = startLaps

func set_race(newLaps: int) -> void:
	numLaps = newLaps
	currLaps = startLaps
	raceRunning = false

func set_num_laps(val: int) -> void:
	numLaps = val

func get_num_laps() -> int:
	return numLaps

func add_lap() -> void:
	print(raceRunning)
	print(numLaps)
	if !raceRunning and currLaps < numLaps:
		raceRunning = true
		currLaps += 1
	elif raceRunning and currLaps < numLaps:
		currLaps += 1
	if raceRunning and currLaps == numLaps:
		raceRunning = false
	print(currLaps)
	print(raceRunning)

func set_curr_laps(val: int) -> void:
	currLaps = val

func get_curr_laps() -> int:
	return currLaps

func set_race_running(val: bool) -> void:
	raceRunning = val

func get_race_running() -> bool:
	return raceRunning
