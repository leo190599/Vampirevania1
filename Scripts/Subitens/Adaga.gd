extends SubitemBase
class_name Adaga

@export var dano:int=2
@export var vel:Vector2
@export var tamanho_do_rastro:int=15

var linha:Line2D

func _ready() -> void:
	$Sprite2D.play("default")
	linha=$Line2D
	linha.reparent(get_tree().current_scene,false)
	if(!olhando_para_direita):
		$Sprite2D.flip_h=true

func _physics_process(delta: float) -> void:
	if(olhando_para_direita):
		position+=vel
	else:
		position-=vel

func atualizar_posicoes_linha():
	linha.add_point(position)

	if(linha.points.size()>tamanho_do_rastro):
		linha.remove_point(0)
		

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	linha.queue_free()
	queue_free()
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	var inimigo:InimigoBase=area.get_parent() as InimigoBase
	if(inimigo):
		inimigo.tomar_dano(dano)
		linha.queue_free()
		queue_free()
	pass # Replace with function body.





func _on_linha_timeout() -> void:
	atualizar_posicoes_linha()
	pass # Replace with function body.
