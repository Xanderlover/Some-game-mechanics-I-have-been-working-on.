class_name DeathComponent
extends Node


func _die() -> void:
	get_parent().queue_free()
