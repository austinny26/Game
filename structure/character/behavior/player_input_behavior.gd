extends CharacterBehavior

func _get_moving_input()->Vector2:
	return Input.get_vector("player_left", "player_right", "player_up", "player_down")

func _get_aiming_input()->Vector2:
	return global_position.direction_to(get_global_mouse_position())

func _physics_process(delta):
	action.moving_direction = _get_moving_input()
	action.aiming_direction = _get_aiming_input()

func _input(event):
	if event.is_action_pressed("fire"):
		action.shoot = true

