extends CharacterBody2D
class_name Character
# Default Character

enum RotationType {NONE, MOVING}

@export var character_stats: CharacterStats
@export var inventory: Inventory

@export var physics_stats: PhysicsStats

# Wil rotate the entire CharacterBody2D towards the aiming/moving direction
@export var rotate_body_towards : RotationType = RotationType.NONE

# Can grab items
@export var can_grab_items := true
@export var can_fly := false



@onready var visual : CharacterVisual = $Visual
@onready var behavior : CharacterBehavior = $Behavior


var _impulse := Vector2.ZERO

# Emitted when the behavior asks to shoot
# Connect this signal to the current weapon shoot function
signal shoot

func _ready():

	
	if !(visual is CharacterVisual):
		printerr("Error: Visual node is not a CharacterVisual (add the corresponding script)")
	if !(behavior is CharacterBehavior):
		printerr("Error: Behavior node is not a CharacterBehavior (add the corresponding script)")
	
	behavior.physics_stats = physics_stats

func _physics_process(delta):
	var action : CharacterActions = behavior.get_action()
	
	
	# Character rotation
	match rotate_body_towards:
		RotationType.MOVING:
			if action.moving_direction != Vector2.ZERO:
				rotation = action.moving_direction.angle()
	
	# gravity
	velocity.y += physics_stats.gravity * delta
	# Character Movement
	
	horizontal_movement(action)
	vertical_movement(action)
	fly()
	
	#if !can_fly:
	#	vertical_movement()
	#	horizontal_movement()
	#elif can_fly && is_on_floor():
	#	vertical_movement()
	#	horizontal_movement()
	#elif can_fly && !is_on_floor() :
	#	vertical_flight()
	#	horizontal_flight()
	
	move_and_slide()
	
	# Character visual update
	visual.update_visual_and_state(action)
	
	# Detect and handle collisions
	for i in get_slide_collision_count():
		behavior.handle_collision(get_slide_collision(i))
		
	
	# Shooting
	if action.shoot:
		action.shoot = false
		emit_signal("shoot")
	
	# Apply Impulse
	if _impulse.length() > 0:
		velocity = _impulse
		_impulse /= 1.2
		if _impulse.length() < 1.0:
			_impulse = Vector2.ZERO

func horizontal_movement(action):
	var horizontal_strength = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if (Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right")):
		if is_on_floor():
			velocity = velocity.lerp(action.moving_direction*physics_stats.max_speed, physics_stats.acceleration)
		else:
			velocity.x = horizontal_strength * physics_stats.max_speed
	else: # Apply Friction
		velocity = velocity.lerp(Vector2.ZERO, physics_stats.friction)

func vertical_movement(action):
	if is_on_floor():
		var vertical_input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		velocity.y += vertical_input * physics_stats.jump_power

func fly():
	var vertical_input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if can_fly && Input.is_action_pressed("ui_up"):
		velocity.y += vertical_input * 50


#func dash():
#	if 



func hit(damage:=1, from:=Vector2.ZERO):
	character_stats.damage(damage)
	if character_stats.current_life == 0:
		die()
	_impulse = from*physics_stats.impulse_force

func die():
	queue_free()

