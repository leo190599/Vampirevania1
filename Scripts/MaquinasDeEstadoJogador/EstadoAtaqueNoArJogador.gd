extends EstadoBaseJogador
class_name EstadoAtaqueNoArJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	iniciar_ataque()

func processar_fisico(delta:float)->void:
		jogador.vel.y+=jogador.gravidade
		jogador.velocity=jogador.vel
		jogador.move_and_slide()
		if(jogador.area_deteccao_chao.has_overlapping_bodies() and jogador.vel.y>0):
			terminar_ataque()
			jogador.vel.y=0
			if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
				jogador._trocar_estado(EstadoAndandoJogador.new())
			else:
				jogador._trocar_estado(EstadoIdleJogador.new())

func iniciar_ataque()->void:
	print("ataque")
func terminar_ataque()->void:
	print("TerminadoAtaque")
