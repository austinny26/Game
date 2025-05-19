extends Node2D

const PLAYER_CHARACTER = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().current_scene == self:
		var player_node = PLAYER_CHARACTER.instantiate()
		add_child(player_node)
		enter_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enter_level():
	var enemies = $Enemies.get_children()
	if enemies.size() > 0:
		print("hi")
