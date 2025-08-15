class_name MovementComponent
extends Node


var move_dir := Vector2(0, 0)
var velocity := Vector2(0, 0)

var speed : float = 0.0
var acceleration : float = 0.0
var deceleration : float = 0.0
var turn_speed : float = 0.0
var max_speed_change : float = 0.0


## Apply desired input direction to movement.
func movement(input_dir: Vector2) -> void:
	move_dir = input_dir * speed

	if not input_dir == Vector2.ZERO:
		if signf(input_dir.x) != signf(velocity.x) or signf(input_dir.y) != signf(velocity.y):
			max_speed_change = turn_speed
		else:
			max_speed_change = acceleration
	else:
		max_speed_change = deceleration

	velocity.x = move_toward(velocity.x, move_dir.x, max_speed_change)
	velocity.y = move_toward(velocity.y, move_dir.y, max_speed_change)


## Modify the controller's current speed stats.
func modify_accelerations(desired_speeds: SpeedsStats) -> void:
	if not desired_speeds:
		return

	speed = desired_speeds.speed
	acceleration = desired_speeds.acceleration
	deceleration = desired_speeds.deceleration
	turn_speed = desired_speeds.turn_speed
