class_name HitstopTime
extends Timer
## Freezes the game for a desired amount of time.


const default_time_scale : float = 1.0


## Control how long time stops.
func hitstop(duration: float = 0.1, time_scale: float = 0.5) -> void:
	Engine.time_scale = time_scale
	start(duration)


## Reset to default time scale when the timer finishes.
func _on_timeout() -> void:
	Engine.time_scale = default_time_scale;
