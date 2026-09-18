extends EstadoBaseJogador
class_name EstadoNoArJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.referenciaSprite.play("NoAr")

func processar_fisico(delta:float)->void:
	if(jogador):
		jogador.vel.y+=jogador.gravidade
		jogador.velocity=jogador.vel
		if(jogador.caindo):
			jogador.vel.x=0
			jogador.velocity=jogador.vel
		jogador.move_and_slide()
		if(jogador.area_deteccao_pulo.has_overlapping_bodies()):
			jogador.vel.y=0
			jogador.velocity=jogador.vel
		if(Input.is_action_just_pressed("Ataque")):
			jogador._trocar_estado(EstadoAtaqueNoArJogador.new())
		if(Input.is_action_just_pressed("SubItem")):
			if(jogador.subitem!=null):
				if(jogador.mana>=jogador.subitem.custo):
					jogador._trocar_estado(EstadoUsandoSubItemNoArJogador.new())
		if(jogador.area_deteccao_chao.has_overlapping_bodies() and jogador.vel.y>0):
			jogador.vel.y=0
			if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
				jogador._trocar_estado(EstadoAndandoJogador.new())
			else:
				jogador._trocar_estado(EstadoIdleJogador.new())
func terminar_estado()->void:
	jogador.caindo=false
