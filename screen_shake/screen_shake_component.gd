class_name ScreenShakeComponent
extends Node
## [ScreenShakeComponent] > Camera Shakes
## ScreenShakeComponent sends our desired screen shake pattern to the camera.


signal Shaken(screen_shake)

const camera_group_name : String = "Camera"

@export var shake_pattern : ShakePattern

var camera : ScreenShakeNode


func _ready() -> void:
	camera = get_tree().get_first_node_in_group(camera_group_name)
	if camera:
		Shaken.connect(camera._shake)


func _shake_screen() -> void:
	if not camera or not shake_pattern:
		return

	Shaken.emit(shake_pattern)
