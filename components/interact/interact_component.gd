class_name InteractComponent
extends Area2D
## Interact with nearby [InteractableNodes].
## [InteractComponent] > InteractableNode


var interactables_array : Array[InteractableNode]


func _on_interactable_enter(area: Node2D) -> void:
	if area is InteractableNode:
		interactables_array.append(area)


func _on_interactable_exit(area: Node2D) -> void:
	if area is InteractableNode:
		interactables_array.erase(area)


## Interact with everything in the list, and pass the Node that wants to interact.
## (Interaction is called from some main controller.)
func interact() -> void:
	for each_interactable in interactables_array:
		each_interactable.interact(self)
