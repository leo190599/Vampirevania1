extends SubitemBase
class_name Adaga

@export var dano:int=2
@export var vel:Vector2

func _ready() -> void:
	$Sprite2D.play("default")
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


func _on_area_entered(area: Area2D) -> void:
	var inimigo:InimigoBase=area.get_parent() as InimigoBase
	if(inimigo):
		inimigo.tomar_dano(dano)
		queue_free()
	pass # Replace with function body.
