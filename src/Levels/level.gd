extends Node2D


@export var numOfLaps = 1

func _ready() -> void:
	RaceData.set_race(numOfLaps)
