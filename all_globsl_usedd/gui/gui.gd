class_name GUI
extends CanvasLayer
## GUI to interrupt the Game.
## Contains [pausing], and [unpausing], [options], and a [HELP] menu.


## Can we pause the game?
@export var can_pause : bool = true
## Name of Input Action to pause.
@export var input_pause : String = "pause"

var mouse_captured : bool = false


#func _ready() -> void:
	#capture_mouse()
	#hide()


func _input(event: InputEvent) -> void:
	if can_pause and event.is_action_pressed(input_pause):
		if not get_tree().paused:
			pause()
		else:
			unpause()


## Interrupts Game.
func pause() -> void:
	get_tree().paused = true
	#release_mouse()
	show()


## Unpause Game.
func unpause() -> void:
	hide()
	#capture_mouse()
	get_tree().paused = false


## Capture the rat. (Hide mouse)
func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true


## Unleash the beast! (Show mouse)
func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false
