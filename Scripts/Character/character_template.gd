extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

@onready var character: AnimatedSprite2D = $AnimatedSprite2D

# Number of extra jumps after the first jump
@export var double_jumps := 1

var jumps_left := 0

func _ready():
	jumps_left = double_jumps + 1

func _physics_process(delta: float) -> void:
	# Gravity
	if !is_on_floor():
		velocity += get_gravity() * delta

	# Reset jumps when touching the floor
	if is_on_floor():
		jumps_left = double_jumps + 1

	# Jump
	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1

	# Horizontal movement
	var direction := Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#sprite menagement
	if direction > 0:
		character.flip_h = false
	elif direction < 0:
		character.flip_h = true


	move_and_slide()
