class_name InteractableNode
extends Area2D
## Recieves from [InteractComponent] and does something all free for you to draw!
## InteractComponent > [InteractNode] [Signal TODO Something!]


## Signal connected to call functions when interacting.
signal interacted


## Base function for what happens when we interact and can be expanded upon.
## If no script uses this function, the signal will automatically emit.
func interact(interactor: InteractComponent) -> void:
	interacted.emit()
