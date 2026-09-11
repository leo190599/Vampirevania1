extends EstadoBaseJogador
class_name EstadoNoArJogador

func processar_fisico(delta:float)->void:
	if(jogador):
		print(jogador.vel)
		jogador.vel.y+=jogador.gravidade
		jogador.velocity=jogador.vel
		jogador.move_and_slide()
		if(Input.is_action_just_pressed("Ataque")):
			jogador._trocar_estado(EstadoAtaqueNoArJogador.new())
		if(jogador.area_deteccao_chao.has_overlapping_bodies() and jogador.vel.y>0):
			jogador.vel.y=0
			if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
				jogador._trocar_estado(EstadoAndandoJogador.new())
			else:
				jogador._trocar_estado(EstadoIdleJogador.new())
