class_name AttackComponent
extends Area2D
## Attack component
## [AttackComponent] > HitboxComponent > HealthComponent
## @experimental

## The attack is stored as a resource, to reuse as presets.
@export var attack_resource : Attack


## Create the [Attack] and pass it to [HitboxComponent].
func damage(body: Node2D) -> void:
	if body is HitboxComponent:
		var hitbox : HitboxComponent = body

		var attack = Attack.new()
		attack.attack_damage = attack_resource.attack_damage
		attack.attack_position = global_position
		attack.knockback_force = attack_resource.knockback_force
		attack.stun_time = attack_resource.stun_time

		hitbox.pass_damage(attack)


func _on_area_entered(area: Area2D) -> void:
	damage(area)
