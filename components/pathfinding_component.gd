class_name PathfindingComponent
extends NavigationAgent2D
## Use this Component with a Node2D inheriting Node.


func find_path(target: Vector2) -> void:
	target_position = target


func _pathfinding_physics_process(delta: float) -> void:
	if is_navigation_finished():
		return

	var next_path_pos: Vector2 = get_next_path_position()
