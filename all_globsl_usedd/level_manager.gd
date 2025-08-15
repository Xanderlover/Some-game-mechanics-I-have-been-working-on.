class_name LevelSelector
extends Node
## Can be used to have a hub area with level selection.
## Can be used to transition between levels chapters, feeling immersive.


## Change the stage to a desired [PackedScene] one.
func _change_level(desired_level: PackedScene) -> void:
	if desired_level:
		get_tree().change_scene_to_packed(desired_level)
