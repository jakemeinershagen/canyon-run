extends Node

signal game_paused
signal game_unpaused

var startLaps: int = -1

var raceRunning: bool = false
var gamePaused: bool = false

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

func toggle_pause() -> void:
	gamePaused = !gamePaused
	if gamePaused:
		emit_signal("game_paused")
	else:
		emit_signal("game_unpaused")

func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()
