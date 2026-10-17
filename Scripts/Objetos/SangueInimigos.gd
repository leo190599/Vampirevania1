extends GPUParticles2D
class_name SangueInimigos

func _ready() -> void:
	$Timer.start(lifetime)


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
