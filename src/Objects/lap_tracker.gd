extends Area2D

@export var startDirection: String = "-X":
	get:
		return startDirection
	set(val):
		startDirection = val.to_upper()

func _on_LapTracker_body_entered(body: Node) -> void:
	# This smells
	if startDirection == "-X":
		if body.global_position.x < position.x:
			RaceData.add_lap()
		elif body.global_position.x > position.x:
			RaceData.remove_lap()
	elif startDirection == "X":
		if body.global_position.x > position.x:
			RaceData.add_lap()
		elif body.global_position.x < position.x:
			RaceData.remove_lap()
	elif startDirection == "-Y":
		if body.global_position.y < position.y:
			RaceData.add_lap()
		elif body.global_position.y > position.y:
			RaceData.remove_lap()
	elif startDirection == "Y":
		if body.global_position.y > position.y:
			RaceData.add_lap()
		elif body.global_position.y < position.y:
			RaceData.remove_lap()
	elif !["X", "-X", "Y", "-Y"].has(startDirection):
		print("Could not resolve startDirection %s in LapTracker" % startDirection)
