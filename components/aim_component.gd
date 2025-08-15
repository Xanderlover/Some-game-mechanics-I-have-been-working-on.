class_name AimComponent
extends Node
## [AimComponent] takes an input, and outputs an aiming direction for firing a projectile


var aim_dir : Vector2


func aim(desired_dir: Vector2) -> void:
	aim_dir.normalized()
