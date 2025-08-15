class_name hitstop_component
extends Node


signal hitstopped(duration: float, time_scale: float)

## How long is time changed for?
@export_range(0.0, 1.0, 0.10, "or_greater") var duration : float = 0.1
## How slow or fast the game speed is?
@export_range(0.0, 1.0, 0.05, "or_greater") var time_scale : float = 0.25


func _ready() -> void:
	hitstopped.connect(HitstopManager.hitstop)


func _start_hitstop() -> void:
	hitstopped.emit(duration, time_scale)
