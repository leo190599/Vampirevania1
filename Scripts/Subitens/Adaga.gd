extends SubitemBase
class_name Adaga

@export var vel:Vector2

func _ready() -> void:
	if(!olhando_para_direita):
		$Sprite2D.flip_h=true

func _physics_process(delta: float) -> void:
	if(olhando_para_direita):
		position+=vel
	else:
		position-=vel


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
