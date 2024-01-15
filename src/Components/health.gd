extends Node

@export var health = 100

func _process(delta):
	if health <= 0:
		RaceData.game_over()

func take_hit(amount):
	health -= amount
