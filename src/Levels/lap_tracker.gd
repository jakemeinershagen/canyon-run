extends Area2D


func _on_LapTracker_body_entered(body: Node) -> void:
	if body.global_position.x < position.x:
		RaceData.add_lap()
