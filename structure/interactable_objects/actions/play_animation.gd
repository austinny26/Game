extends InteractableObjectAction

# A QuiverInteractableObjectAction that plays an animation

@export var animation_player_path: NodePath
@export var animation_name: String

@onready var _animation_player = get_node(animation_player_path)


func trigger(object: InteractableObject, character: Character):
	(_animation_player as AnimationPlayer).play(animation_name)

