class_name StateMachine
extends Node
## A Finite-State Machine that holds [State] nodes to make them transition.
##
## When to use a state machine? Whenever you want to transition,
## between different modes that will not override eachother.
##
## Pros:
## + It's great for animations, or movement that is unique.
## + Simplify the code instead of shoving it all in one class
## Cons:
## - Applying the pattern can be overkill if the machine has a few states
## - Or rarely changes.


## Initial we will be using.
@export var initial_state : State

## All of the states we have, will be stored in this dictionary.
var states : Dictionary = {}
## Our current state that we are using.
var current_state : State


## Set the dictionary state, and the current state.
func _ready() -> void:
	# Get every State that is a child to this node and add it to the dictionary
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			
			# Connect all children to our function
			child.transitioned.connect(_on_child_transitioned)

	# If we have an initial, state use that
	if initial_state:
		initial_state._state_enter()
		current_state = initial_state

	# CRITICAL If we haven't set any inital state, use the first one that is a child
	#if not initial_state:
		#for child in get_children():
			#if child is State:
				#initial_state = child
				#initial_state._state_enter()
				#current_state = initial_state
		#push_error("No Initial State found: ", get_parent().name, " Using the first state available")


## Pass the process.
func _process(delta: float) -> void:
	if current_state:
		current_state._state_update(delta)


## Pass the physics process.
func _physics_process(delta: float) -> void:
	if current_state:
		current_state._state_physics_update(delta)


## Gets called to transition to a desired state.
func _on_child_transitioned(state: State, desired_state: String) -> void:
	# Make sure we are currently not in the same state
	# "not" is "!=" わかる？
	if not state == current_state:
		return

	var new_state : State = states.get(desired_state.to_lower())
	# Make sure the new state exist
	if not new_state:
		return

	# Call _exit() function before we switch the states
	if current_state:
		current_state._state_exit()

	new_state._state_enter()

	current_state = new_state
