extends InteractableObjectAction
class_name PickItemAction

# This defines the QuiverPickableItem action.
# Please do not modify this script.
# If needed, you can create your own type of QuiverPickItemAction by extending this script.

# Will be called by the pickable item when being interacted.
# DO NOT OVERRIDE to define your behavior, override pick_item
func trigger(object: InteractableObject, character: Character):
	if object is PickableItem:
		pick_item(object, character)


# Defines what happens when the item is picked (= object interracted)
func pick_item(pickable_item: PickableItem, character: Character):
	pass
