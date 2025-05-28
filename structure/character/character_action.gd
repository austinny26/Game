class_name CharacterActions
extends Object

# This is a custom type to cover any character action

# If the character is trying to shoot
var shoot := false
# The character moving direction
var moving_direction := Vector2.ZERO:
	set(value):
		moving_direction = value.normalized()

func _init(moving_direction : Vector2, shoot := false):
	self.moving_direction = moving_direction
	self.shoot = shoot

func set_state(state_name:String)->void:
	self.state_name = state_name
