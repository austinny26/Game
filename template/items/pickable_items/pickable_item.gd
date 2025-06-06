@tool
extends InteractableObject
class_name PickableItem

# The pickable item is a specific interactable object that holds a QuiverItem.
# It can be interacted (to pick it up, or use it instantly) as an interactable object.

# The corresponding item
@export var item: Item


func _get_configuration_warnings():
	var warnings = super._get_configuration_warnings()
	if not item is Item:
		warnings.append("item from PickableItem should be of type QuiverItem")
	return warnings
