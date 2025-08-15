class_name SFXComponent
extends AudioStreamPlayer2D
## Sound Effects component that has built in pitch randomizer, and sound priority selector!
##
## The more the sound is relevant to the player, the louder that sound should be.
## @experimental


## Sound Priority.
## The more the sound is relevant to the player. The louder that sound should be.
enum Priorities {
	## [param LOUDEST] sound should be [code]KO[/code].
	LOUDEST,
	## Second loudest sound can be the [code]DAMAGE[/code].
	IMPACTS,
	## Third loudest sound is the [code]Anticipation[/code] of a [param special move].
	SPECIAL,
	## Voices deserve the same [param priority] as [param special moves]. Clear speech cuts through other sounds.
	EXCLAIM,
	## Falls somewhere between [param Special] and [param Voice], Depends on explosion size.
	EXPLODE,
	## Anything that provides feedback for button presses. [param DASHING] or [param SLASHES].
	DASHING,
	## [param Jumping] and [param Landing] are in this category.
	JUMPING,
	## SOFTEST sound is [code]walking[/code].
	SOFTEST,
}

@export var sound_priority : Priorities


## How low in pitch can we go?
@export_range(0.01, 1.0, 0.01, "or_greater") var random_pitch_min : float = 0.75
## How high in pitch can we go?
@export_range(0.01, 4.0, 0.01, "or_greater") var random_pitch_max : float = 1.75


## Can be called from a signal to play this sfx.
func _play_sound() -> void:
	var random_pitch = randf_range(random_pitch_min, random_pitch_max)
	pitch_scale = random_pitch
	play()
