extends CharacterVisual

# This Visual works with an AnimationTree (and an AnimationPlayer)
# See the example under res://Demos/AnimatedCharacter

enum RotationMode {NONE,MOVING}

# Will the character rotate on aiming or moving ?

# How many different angles do you want your character to rotate
# You will need to prepare a walking and idle animation for each angle
@export var rotation_clamping := 4



@onready var animation_tree : AnimationTree = $AnimationTree

func update_visual(action: CharacterActions):
	var is_moving = action.moving_direction.length() > 0
	animation_tree["parameters/blend/blend_amount"] = int(is_moving)
	


func _apply_rotation(angle):
	var k = int(round(angle/(2*PI/rotation_clamping)))
	k = (k+rotation_clamping)%rotation_clamping
	
	animation_tree["parameters/idlestate/current"] = k
	animation_tree["parameters/walkstate/current"] = k
