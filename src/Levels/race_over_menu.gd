extends Control

@onready var yourTime: Node = get_node("YourTimeLabel")
@onready var bestTime: Node = get_node("BestTimeLabel")

func _ready():
	connect("race_data_times_updated", _on_race_data_times_updated)


func _process(delta):
	if !RaceData.raceOver:
		visible = false
	else:
		visible = true


func _on_race_data_times_updated() -> void:
	yourTime.text = "Your Time: %f" % RaceData.currentTime
	bestTime.text = "Best Time: %f" % RaceData.fastestTime
