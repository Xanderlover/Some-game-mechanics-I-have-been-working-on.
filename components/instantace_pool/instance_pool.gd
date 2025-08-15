class_name InstancePool
extends Node
## Pool that holds everything that we want to instantiate into the world.
##
## Pool containing bullets that are spawned and destroyed
## What if we make this umm a singleton?
## @experimental


## Spawn any desired scene into the world.
func _spawn_scene(desired_scene: PackedScene, location: Vector2 = Vector2(0, 0)) -> void:
	var spawned_scene = desired_scene.instantiate()
	add_child(spawned_scene)

	spawned_scene.position = location


## Spawn a bullet to the world.
func _spawn_bullet(bullet: PackedScene, direction: float, location: Vector2) -> void:
	var spawned_bullet = bullet.instantiate()
	add_child(spawned_bullet)

	spawned_bullet.rotation = direction
	spawned_bullet.position = location
	spawned_bullet.velocity = spawned_bullet.velocity.rotated(direction)
