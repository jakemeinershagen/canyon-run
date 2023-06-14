@tool
extends Node

@onready var tracker: Area2D = get_parent()
@onready var arrow: Polygon2D = tracker.get_node("Arrow")
var prevDir = ""

func _ready():
	if Engine.is_editor_hint():
		prevDir = tracker.startDirection
		arrow.visible = true
	else:
		arrow.visible = false

func _process(_delta):
	if Engine.is_editor_hint():
		"""
		I had to do to_upper on this even though the setter has it
		I suspect it has something to do with how tools get the values
		from other nodes. It works now
		"""
		var dir: String = tracker.startDirection.to_upper()
		if dir != prevDir:
			prevDir = dir
			assert(["X", "-X", "Y", "-Y"].has(dir),
					"ERROR: Invalid Value for startDirection on LapTracker")
			if dir == "-X":
				tracker.rotation_degrees = 0
				print("Valid startDirection")
			elif dir == "X":
				tracker.rotation_degrees = 180
				print("Valid startDirection")
			elif dir == "-Y":
				tracker.rotation_degrees = 90
				print("Valid startDirection")
			elif dir == "Y":
				tracker.rotation_degrees = 270
				print("Valid startDirection")
