extends Actor

export var stomp_impulse: = 1000.0

func _on_DeathSetter_area_entered(area) -> void:
	 _velocity = calculate_Stomp_velocity(_velocity,stomp_impulse)
	
	
	
func _on_DeathSetter_body_entered(body) -> void:
	 
	 _velocity.y = -2000
	 collision_mask = false
	 
	 
	 # or you can  queue_free()
	
	
	

func _physics_process(delta) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity,direction,speed, is_jump_interrupted)
	 
	move_and_slide(_velocity,FLOOR_NORMAL)
	
	
	

# calculates direcion based on power of pressed button

func get_direction() -> Vector2:
	return Vector2( 
	Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), -1.0
	if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0)
	
# is_jump_interrupted variable ultimately is a bool to help make a super mario like jump control as to make the pressure
# put on the button and duration used to decide how how the player jumps


func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
	) -> Vector2:
	
	var out = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out

func calculate_Stomp_velocity(linear_velocity: Vector2, impulse: float ) -> Vector2:
	 var out := linear_velocity
	 out.y = -impulse
	 return out

		  



