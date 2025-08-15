class_name ShakePattern
extends Resource

## How fast is the camera shake?
@export var speed : float = 15.0
## How far does the [Camera2D] offest up and down, left and right?
@export var amplitude := Vector2(0, 0)
## How far does the [Camera2D] sustain up and down, left and right?
@export var sustain_amplitude := Vector2(0, 0)
## [param Whirlpool] technique moves the camera in a circular way. Control the size of the circle.
@export var whirlpool_size : float = 20.0
## How long is the screen shake applied for?
@export var shake_time : float = 1.0

@export_category("Pattern Description")
@export_multiline var description : String = "These aren't just scaled versions of the same shake. But actually use different patterns entirely."
