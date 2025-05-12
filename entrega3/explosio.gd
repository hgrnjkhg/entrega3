extends Node2D

func _ready() -> void:
	$CPUParticles2D.emitting = true
	await $CPUParticles2D.finished
	queue_free()
	#if Input.is_action_just_pressed("ui_accept"):
		#$CPUParticles2D.emitting = true

	
