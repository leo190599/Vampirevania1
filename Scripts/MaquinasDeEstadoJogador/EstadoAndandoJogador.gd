extends EstadoBaseJogador
class_name EstadoAndandoJogador

func processar_fisico(delta:float)->void:
	if (Input.is_action_just_pressed("Ataque")):
		jogador._trocar_estado(EstadoAtaqueJogador.new())
	elif(Input.is_action_pressed("Direita")):
		jogador.vel.x=jogador.vel_de_movimento
		jogador.velocity=jogador.vel
		jogador.move_and_slide()
		pular()
		abaixar()
	elif(Input.is_action_pressed("Esquerda")):
		jogador.vel.x=-jogador.vel_de_movimento
		jogador.velocity=jogador.vel
		jogador.move_and_slide()
		pular()
		abaixar()
	else:
		jogador._trocar_estado(EstadoIdleJogador.new())

func pular()->void:
	if(Input.is_action_just_pressed("pulo")):
			jogador.vel.y=jogador.vel_de_pulo
			jogador._trocar_estado(EstadoNoArJogador.new())
func abaixar()->void:
	if(Input.is_action_pressed("Baixo")):
		jogador._trocar_estado(EstadoAbaixadoJogador.new())
