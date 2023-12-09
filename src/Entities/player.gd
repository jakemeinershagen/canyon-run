extends CharacterBody2D


@export var maxSpeed: float = 500.0
@export var accel: float = 30.0
@export var friction: float = 5.0

@onready var target = position
var vel = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if RaceData.gamePaused:
		return
	
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
	velocity = velocity.limit_length(maxSpeed)
	
	# should be taking care of delta
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity


func wall_hit():
	print("hit wall")


# checks if player has hit the wall
func _on_Hitbox_body_entered(body: Node) -> void:
	if body is TileMap:
		wall_hit()
