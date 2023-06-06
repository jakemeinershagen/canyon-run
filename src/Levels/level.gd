extends Node2D


export var numOfLaps = 2

func _ready() -> void:
	RaceData.set_race(numOfLaps)

