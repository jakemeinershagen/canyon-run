extends Node2D


export var numOfLaps = 2
onready var currLap = 0
onready var raceRunning = false


func get_race_running():
	return raceRunning


func _on_LapTracker_lap_triggered() -> void:
	print(raceRunning, currLap)
	if raceRunning == false:
		raceRunning = true
		currLap += 1
	elif raceRunning and currLap < numOfLaps:
		currLap += 1
	elif raceRunning and currLap == numOfLaps:
		raceRunning = false
	print(raceRunning, currLap)
