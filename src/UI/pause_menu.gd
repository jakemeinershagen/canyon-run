extends Control

func _process(_delta):
	if !RaceData.gamePaused:
		visible = false
	else:
		visible = true
