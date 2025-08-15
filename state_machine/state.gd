class_name State
extends Node
## Base [State] node to extend for different behaviours.


## Emits when transition to another [State]
signal transitioned


## Called when entering the state.
func _state_enter() -> void:
	pass


## Called when exiting the state.
func _state_exit() -> void:
	pass


## Called every frame.
## (While [State] is active)
func _state_update(_delta: float) -> void:
	pass


## Called every physics frame.
## (While state is active)
func _state_physics_update(_delta: float) -> void:
	pass


## Called to transition to a desired [state].
func _state_transition_to(desired_state: State) -> void:
	transitioned.emit(self, desired_state.name.to_lower())
