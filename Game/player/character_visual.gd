extends CharacterVisual

enum RotationMode {NONE, MOVING}
# Will the character rotate on aiming or moving ?

# How many different angles do you want your character to rotate
# You will need to have a walking animation for each angle
@export var rotation_clamping := 4

@onready var body: AnimatedSprite2D = $Body

@onready var weapon = $DistanceWeapon


func update_visual(action: CharacterActions):
	
	if action.moving_direction.length() > 0:
		body.play()
	else:
		body.stop()
		body.frame = 0 # The standing/idle frame
	
	if action.moving_direction.length() > 0:
		body.scale = Vector2(int(action.moving_direction.x>=0)*2-1,1)
		_apply_body_rotation(action.moving_direction.angle())
	

func _apply_body_rotation(angle):
	var k = int(round(angle/(2*PI/rotation_clamping)))
	k = (k+rotation_clamping)%rotation_clamping
	if body.animation != 'move_' + str(k):
		body.frame = 1
	body.animation = 'move_' + str(k)


