class_name InstantiateComponent
extends Node2D


## Emits to instantiate something inside the [InstancePool]
signal instantiated(desired_scene: PackedScene, location: Vector2)

const instance_group_name : String = "InstancePool"

## Which scene do we want to spawn?
@export var desired_scene : PackedScene


## Connect the signal to the instance pool.
func _ready() -> void:
	var instance_pool : InstancePool = get_tree().get_first_node_in_group(instance_group_name)
	if instance_pool:
		instantiated.connect(instance_pool._spawn_scene)


## Emit a signal to instantiate particles
func _instantiate() -> void:
	instantiated.emit(desired_scene, global_position)
