extends Area2D

signal died

@export_range(1,100) var max_life := 5:
	set(value):
		max_life = value
		if current_life > max_life:
			current_life = max_life

# the current character life
var current_life := 5:
	set(value):
		current_life = max_life if value >= max_life else value
		if current_life <= 0:
			current_life = 0
			died.emit()

# set current life to be equal to max life
func set_life_to_max():
	current_life = max_life

func damage(amount:int):
	current_life -= amount
