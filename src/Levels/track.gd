extends TileMap

@export var numOfLaps = 1


func _ready():
	RaceData.set_race(numOfLaps)
