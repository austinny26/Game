extends CharacterBehavior


func _get_moving_input()->Vector2:
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")


func _physics_process(delta):
	action.moving_direction = _get_moving_input()
	
