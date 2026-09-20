extends EstadoBaseJogador
class_name EstadoIdleJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.referenciaSprite.play("Idle")
	jogador.vel.x=0
	jogador.velocity=jogador.vel

func processar_fisico(delta:float)->void:
	if(jogador.area_deteccao_degraus.has_overlapping_areas()):
		var degrau:Degrau=jogador.get_degrau()
		if(degrau):
			if(degrau.sobe && Input.is_action_pressed("Cima")):
				var novoEstadoNaEscada:EstadoNaEscadaJogador=EstadoNaEscadaJogador.new()
				novoEstadoNaEscada.degrau=degrau
				jogador._trocar_estado(novoEstadoNaEscada)
				return
			if(!degrau.sobe && Input.is_action_pressed("Baixo")):
				var novoEstadoNaEscada:EstadoNaEscadaJogador=EstadoNaEscadaJogador.new()
				novoEstadoNaEscada.degrau=degrau
				jogador._trocar_estado(novoEstadoNaEscada)
				return
	if(!jogador.area_deteccao_chao.has_overlapping_bodies()):
		jogador._trocar_estado(EstadoNoArJogador.new())
	if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
		jogador._trocar_estado(EstadoAndandoJogador.new())
	if(Input.is_action_just_pressed("pulo")):
		jogador.vel.y=jogador.vel_de_pulo
		jogador._trocar_estado(EstadoNoArJogador.new())
	if(Input.is_action_just_pressed("Ataque")):
		jogador._trocar_estado(EstadoAtaqueJogador.new())
	if (Input.is_action_just_pressed("SubItem")):
		if(jogador.subitem!=null):
			if(jogador.mana>=jogador.subitem.custo):
				jogador._trocar_estado(EstadoUsandoSubItemJogador.new())
	if(Input.is_action_pressed("Baixo")):
		jogador._trocar_estado(EstadoAbaixadoJogador.new())
