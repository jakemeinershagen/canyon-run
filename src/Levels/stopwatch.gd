extends Node

onready var timeElapsed: float = 0.00
var isRunning: bool = false


func _process(delta: float) -> void:
	isRunning = RaceData.get_race_running()
	if isRunning:
		timeElapsed += delta


func getTimeString():
	var minutes = floor(timeElapsed / 60)
	var seconds = int(timeElapsed) % 60
	var milliseconds = int(timeElapsed * 1000) % 1000
	return "%02d:%02d:%03d" % [minutes, seconds, milliseconds]


func start():
	isRunning = true


func stop():
	isRunning = false

