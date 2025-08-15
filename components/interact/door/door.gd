class_name Door
extends InteractableNode
## [Door] that can be linked with another [Door].
## Can be used to teleport to a desired location.

## The position the player will end up in, can be another door to be linked.
@export var door : Door
## Is the door currently locked? Cannot be interacted with.
@export var locked : bool = false


func interact(interactor: InteractComponent) -> void:
	if not door:
		return

	if locked:
		# Play lock animation
		return

	## TODO: Use something better instead of get_owner or get_parent.
	if interactor.get_owner() is Node2D:
		interactor.get_owner().global_position = door.global_position

		interacted.emit()


func lock() -> void:
	## Play the animation to lock the door.
	locked = true


func unlock() -> void:
	## Play the animation to unlock the door.
	locked = false
