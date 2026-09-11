extends CharacterBody2D
class_name  ColetavelSubItem

@export var subItem:SubitemObjetoScriptavel
@export var vel:float=20

var direcao_de_movimento:Vector2=Vector2(0,1)

func _ready() -> void:
	$SimboloSubItem.texture=subItem.sprite

func _physics_process(delta: float) -> void:
	move_and_collide(direcao_de_movimento*vel*delta)


func _on_area_2d_body_entered(body: Node2D) -> void:
	var jogador:Jogador=body as Jogador
	if (jogador):
		jogador.trocar_subItem(subItem)
		queue_free()
	pass # Replace with function body.
