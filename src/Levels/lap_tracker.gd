extends Area2D


func _on_LapTracker_body_entered(body: Node) -> void:
	#TODO: figure out if there is a better way to prevent tilemap from
	# colliding with lap tracker
	if body.global_position.x < position.x && body.get_name() == "Player":
		RaceData.add_lap()
