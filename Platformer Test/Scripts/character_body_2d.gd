extends CharacterBody2D


const RUN_SPEED = 80
const SPEED = 70.0
const JUMP_VELOCITY = -400.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("Fall")
	
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		if Input.is_action_pressed("run"):
			velocity.x = direction * (SPEED + RUN_SPEED)
			if Input.is_action_pressed("left"):
				$AnimatedSprite2D.scale.x = -1
			elif Input.is_action_pressed("right"):
				$AnimatedSprite2D.scale.x = 1
			$AnimatedSprite2D.play("Run")
			
		else:
			velocity.x = direction * SPEED
			if Input.is_action_pressed("left"):
				$AnimatedSprite2D.scale.x = -1
			elif Input.is_action_pressed("right"):
				$AnimatedSprite2D.scale.x = 1
			$AnimatedSprite2D.play("Walk")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("Idle")
	if not is_on_floor():
		if velocity.y <= 0:
			$AnimatedSprite2D.play("Jump")
		else:
			$AnimatedSprite2D.play("Fall")
	
	


	move_and_slide()
