extends Control

@onready var yourTime: Node = get_node("YourTimeLabel")
@onready var bestTime: Node = get_node("BestTimeLabel")


func _process(_delta):
	if !RaceData.raceOver:
		visible = false
	else:
		visible = true


func _on_stopwatch_race_data_times_updated():
	yourTime.text = "Your Time: %f" % RaceData.currentTime
	bestTime.text = "Best Time: %f" % RaceData.fastestTime
