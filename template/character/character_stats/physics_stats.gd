extends Resource
class_name PhysicsStats

# This resource type holds the parameters to tweak character's physics.

@export var max_speed := 150.0
@export var jump_power := 400
@export var gravity := 1500
@export var acceleration := 0.4
@export var friction := 0.1

# The impulse force applied when the character is hit (zero means no impulse)
@export var impulse_force := 0.0
