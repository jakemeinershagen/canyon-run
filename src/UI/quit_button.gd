extends Button


func _on_button_up() -> void:
	LevelLoader.save_game()
	get_tree().quit()
