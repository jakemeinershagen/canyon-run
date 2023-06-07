extends Label


func _process(_delta: float) -> void:
	var curr: int = RaceData.get_curr_laps()
	if curr < 0:
		curr = 0
	text = "%d/%d" % [curr, RaceData.get_num_laps()]
