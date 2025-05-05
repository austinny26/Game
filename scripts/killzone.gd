extends Area2D
@onready var timer = $Timer
@onready var player = $"../Player"

func _on_body_entered(body):
	emit_signal("take_damage", 10)
	timer.start()






func _on_player_take_damage(int):
	pass # Replace with function body.
