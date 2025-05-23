extends Character

@export var gui_path: NodePath

func hit(damage:=1, from:=Vector2.ZERO):
	super.hit(damage, from)
	
