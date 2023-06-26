extends Label

@onready var stopwatch: Node = get_node("Stopwatch")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = stopwatch.getTimeString()
