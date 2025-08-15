class_name HealthComponent
extends Node
## Health component used for composing basic to complex systems.
## AttackComponent > HitboxComponent > [HealthComponent]


## Emits when taking damage.
signal damaged
## Emits when dead, useful for unique deaths.
signal died

## Desired max lives.
@export var max_health : int = 6
## Can we take damage?
@export var is_invincible : bool = false

## Current lives.
var health : int


func _ready() -> void:
	health = max_health


## Decrease health, check if we are dead, and continue with logic.
func take_damage(attack: Attack) -> void:
	if is_invincible:
		return

	health -= attack.attack_damage

	if health <= 0:
		died.emit()
		return

	# TODO: Emit to pass the attack
	damaged.emit()
	damaged.emit(attack)


func _enable_invincibility() -> void:
	is_invincible = true


func _disable_invincibility() -> void:
	is_invincible = false
