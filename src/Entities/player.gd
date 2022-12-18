extends KinematicBody2D


export (float) var maxSpeed = 500
export (float) var accel = 20
export (float) var friction = 5

onready var target = position
var velocity = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var mousePosition = get_global_mouse_position()
	look_at(mousePosition)
	
	# friction
	var normalizedVel = velocity.normalized()
	velocity.x -= normalizedVel.x * friction
	velocity.y -= normalizedVel.y * friction
	
	# acceleration
	var mouseClickStrength = Input.get_action_strength("click")
	var mouseDirection = position.direction_to(mousePosition)
	velocity.x += mouseDirection.x * mouseClickStrength * accel
	velocity.y += mouseDirection.y * mouseClickStrength * accel
	
	# clamp velocity final
	velocity = velocity.clamped(maxSpeed)
	print(velocity)
	
	# should be taking care of delta
	velocity = move_and_slide(velocity)

