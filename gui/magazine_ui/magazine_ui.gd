extends Control

@export var magazine: Magazine

func _ready():
	if magazine is Magazine:
		magazine.magazine_changed.connect(self.update_ui)
		update_ui()

# Override this function to make your own UI
func update_ui():
	print("MagazineUI: %d/%d" % [magazine.ammo_count, magazine.capacity])
