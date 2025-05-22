extends InteractableObjectAction

# A simple example of QuiverInteractableObjectAction that just instantly destroys the object

func trigger(object: InteractableObject, character: Character):
	object.queue_free()

