extends Area2D
class_name ColetavelVida

var quantidade_de_vida:int=10

func _ready() -> void:
	$AnimationPlayer.play("Flutuar")

func _on_body_entered(body: Node2D) -> void:
	var jogador:Jogador=body as Jogador
	if(jogador):
		jogador.curar(quantidade_de_vida)
		queue_free()
	pass # Replace with function body.
