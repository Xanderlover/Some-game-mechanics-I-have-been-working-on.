class_name HitboxComponent
extends Area2D
## Hitbox Component emits a signal when hit with an [Attack].
## [Hitboxcomponent] can be used with [HealthComponent].
## AttackComponent > [HitboxComponent] > HealthComponent


## Emits when hitbox passes an attack.
## Useful for unique things that exclude [HealthComponent]
signal hitbox_triggered

## Pass damage to health componnet.
@export var health_component : HealthComponent


## Pass the [Attack] to the [HealthComponent].
func pass_damage(attack: Attack):
	if health_component:
		health_component.take_damage(attack)

	hitbox_triggered.emit()
