extends Object
class_name EstadoBaseJogador

var jogador:Jogador


func iniciar_estado(parametrojogador:Jogador)->void:
	jogador=parametrojogador
	
func processar(delta:float)->void:
	pass
func processar_fisico(delta:float)->void:
	pass
func terminar_estado()->void:
	pass
