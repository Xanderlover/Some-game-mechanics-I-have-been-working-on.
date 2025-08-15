class_name Attack
extends Resource
## Attack inheritance, and resource, used as a simple blueprint for our [AttackComponent].
## [AttackComponent] > HitboxComponent > HealthComponent
## @experimental


## How much does the attack deal damage?
@export var attack_damage : int = 1
## How far are we knocked back from the attack?
@export var knockback_force : float = 100.0
## How long are we stunned for, after the attack hits us?
@export var stun_time : float = 0.5

## Position of the attack.
var attack_position : Vector2


## Custom debug function that prints the properties of the [Attack]
func debug_attack_dmg() -> void:
	print("The attack is: " + str(attack_damage) + " dmg!")
