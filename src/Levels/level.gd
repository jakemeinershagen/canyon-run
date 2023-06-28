extends Node2D


@export var numOfLaps = 1

func _enter_tree():
	LevelLoader.load_game()
	RaceData.set_race(numOfLaps)
