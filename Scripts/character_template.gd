extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

# set amount of double jumps a character can do
@export var double_jumps = 0
var jumps_left = double_jumps


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump and double jumps
	if Input.is_action_just_pressed("jump") and jumps_left != 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
	
	# reset jumps_left when you hit floor to designated amount of double jumps
	if jumps_left < double_jumps and is_on_floor():
		jumps_left = double_jumps

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true

	move_and_slide()
