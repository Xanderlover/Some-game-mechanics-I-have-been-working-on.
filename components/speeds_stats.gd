class_name SpeedsStats
extends Resource
## Resource that contains data for speed stats.

## Normal speed.
@export var speed : float
## How fast to reach max speed.
@export_range(0, 100, 1) var acceleration : float
## How fast to stop after letting go.
@export_range(0, 100, 1) var deceleration : float
## How fast to stop when changing direction.
@export_range(0, 100, 1) var turn_speed : float
