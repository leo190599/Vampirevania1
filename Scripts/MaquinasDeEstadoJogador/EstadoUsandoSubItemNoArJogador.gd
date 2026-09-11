extends EstadoBaseJogador
class_name EstadoUsandoSubItemNoArJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	iniciar_uso_subItem()

func iniciar_uso_subItem():
	jogador.usar_sub_item()
	terminar_uso_subItem()
	pass
func terminar_uso_subItem():
	pass

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
