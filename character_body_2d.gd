extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const DASH_SPEED = 600.0 
var dashing = false






func _on_dash_timer_timeout():
	dashing= false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction.
	var direction = Input.get_axis("ui_left", "ui_right")


	var character = $AnimatedSprite2D
	
	
	if direction:
		# 1. Determinar el 'flip' del personaje.
		character.flip_h = (direction == -1)
		
		# 2. Determinar la velocidad, dando prioridad al dash.
		if dashing:
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED # Velocidad normal
			
	else:
		# 3. Sin entrada de dirección: Desacelerar / Frenar.
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# Handle dash activation.
	if Input.is_action_just_pressed("dash") and not dashing and direction != 0:
		dashing = true
		$"Dash timer".start()

	

	move_and_slide()
