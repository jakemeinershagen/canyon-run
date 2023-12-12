extends VBoxContainer

@onready var trackButton = preload("res://src/UI/track_button.tscn")
var trackNum = 1

func _ready():
	var dir = DirAccess.open("res://src/Tracks")
	
	for name in dir.get_files():
		name = name.get_slice(".", 0)
		var trackButtonInst = trackButton.instantiate()
		trackButtonInst.trackName = name
		trackButtonInst.text = "Track " + str(trackNum)
		add_child(trackButtonInst)
		
		trackNum += 1
