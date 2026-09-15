extends EstadoBaseJogador
class_name EstadoTomandoDanoJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.referenciaSprite.play("TomandoDano")
	if(jogador.olhando_para_direita):
		jogador.vel.x=-jogador.vel_de_movimento
	else :
		jogador.vel.x=jogador.vel_de_movimento
	jogador.vel.y=jogador.vel_de_pulo
	jogador.velocity=jogador.vel

func processar_fisico(delta:float)->void:
	if(jogador):
		jogador.vel.y+=jogador.gravidade
		jogador.velocity=jogador.vel
		jogador.move_and_slide()
		if(jogador.area_deteccao_chao.has_overlapping_bodies() and jogador.vel.y>0):
			jogador.vel.y=0
			if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
				jogador._trocar_estado(EstadoAndandoJogador.new())
			else:
				jogador._trocar_estado(EstadoIdleJogador.new())
