extends Label


func _process(_delta: float) -> void:
	var curr: int = RaceData.currLaps
	if curr < 0:
		curr = 0
	text = "%d/%d" % [curr, RaceData.numLaps]
