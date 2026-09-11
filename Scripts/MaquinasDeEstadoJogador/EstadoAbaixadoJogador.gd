extends EstadoBaseJogador
class_name EstadoAbaixadoJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	print("Abaixado")

func processar_fisico(delta:float)->void:
	if(!Input.is_action_pressed("Baixo")):
		if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
			jogador._trocar_estado(EstadoAndandoJogador.new())
		else :
			jogador._trocar_estado(EstadoIdleJogador.new())
	if(Input.is_action_just_pressed("Ataque")):
		jogador._trocar_estado(EstadoAtaqueAbaixadoJogador.new())
	if (Input.is_action_just_pressed("SubItem")):
		if(jogador.subitem!=null):
			if(jogador.mana>=jogador.subitem.custo):
				jogador._trocar_estado(EstadoUsandoSubItemJogador.new())
