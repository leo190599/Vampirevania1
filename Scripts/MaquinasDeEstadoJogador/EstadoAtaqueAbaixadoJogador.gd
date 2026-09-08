extends EstadoBaseJogador
class_name EstadoAtaqueAbaixadoJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	iniciar_ataque()
	
func processar_fisico(delta:float)->void:
	terminar_ataque()
	if(Input.is_action_pressed("Baixo")):
		jogador._trocar_estado(EstadoAbaixadoJogador.new())
	elif(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
		jogador._trocar_estado(EstadoAndandoJogador.new())
	else:
		jogador._trocar_estado(EstadoIdleJogador.new())

func iniciar_ataque()->void:
	print("Ataque abaixado")
	pass
	
func terminar_ataque()->void:
	print("Terminado ataque abaixado")
	pass
