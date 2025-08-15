class_name ScreenShakeNode
extends Camera2D
## Camera Shake, shakes or offsets the camera in a desired size. And the shape of a whirlpool pattern.
##
## Normal/Whirlpool technique. The shake starts strong then gradually subsides.
## Sustain technique. The shaking helps convey the movement of terrain.

## How fast is the camera shake?
@export var speed : float = 15.0
## How far does the [Camera2D] offset every frame?
@export var amplitude := Vector2(0, 0)
## How far does the [Camera2D] offest up and down, left and right?
@export var sustain_amplitude := Vector2(0, 0)
## [param Whirlpool] technique moves the camera in a circular way. Control the size of the circle.
@export var whirlpool_size : float = 15.0

#var dst_mult : float = 1.0
var time : float = 0.0
var shake_time : float = 0.0

var min_whirlpool_size : float = 5.0
var max_whirlpool_size : float = 5.0
var random_whirlpool : float
var flip_whirlpool : bool = false

var normal : Vector2
var sustain : Vector2
var whirlpool : Vector2

@onready var debug_label: Label = $DEBUGGroup/DEBUGLabel
@onready var debug_center_point: Sprite2D = $DEBUGGroup/DEBUGCenterPoint


func _process(delta: float) -> void:
	time += delta

	## Normal technique (uses offsets)
	normal = offset_technique(amplitude)
	## Sustain technique
	sustain = offset_technique(sustain_amplitude)
	## Whirlpool technique (moves in a whirpool circular way)
	whirlpool = Vector2( cos(-time * speed) , sin(-time * speed) ) * random_whirlpool

	offset = sustain + ((normal + whirlpool) * shake_time)

	if shake_time >= 0.0:
		shake_time -= delta
	elif shake_time < 0.0:
		shake_time = 0.0

	# DEBUG MODE rhymes with BigMode
	debug_center_point.position = offset
	debug_label.text = str(Vector2i(offset))


func offset_technique(desired_amplitude: Vector2) -> Vector2:
	return Vector2( sin(time * speed) * desired_amplitude.x ,
					sin(time * speed) * desired_amplitude.y )


## Called to shake the [Camera2D] with a desired pattern.
func _shake(shake_pattern: ShakePattern) -> void:
	speed = shake_pattern.speed

	## TODO : I'm programming oon my last brain cells
	if not shake_pattern.amplitude == Vector2.ZERO:
		amplitude = shake_pattern.amplitude

	if not shake_pattern.sustain_amplitude == Vector2.ZERO:
		sustain_amplitude = shake_pattern.sustain_amplitude

	if not shake_pattern.whirlpool_size == 0.0:
		whirlpool_size = shake_pattern.whirlpool_size
	shake_time = shake_pattern.shake_time

	# Randomize
	random_whirlpool = randf_range(
			whirlpool_size - min_whirlpool_size,
			whirlpool_size + max_whirlpool_size)
	## TODO Randomize direciton
