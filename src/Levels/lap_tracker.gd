extends Area2D


func _on_LapTracker_body_entered(body: Node) -> void:
	#TODO: figure out if there is a better way to prevent tilemap from
	# colliding with lap tracker
	if body.global_position.x < position.x:
		RaceData.add_lap()
