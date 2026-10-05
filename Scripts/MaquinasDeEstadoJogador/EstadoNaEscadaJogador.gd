extends EstadoBaseJogador
class_name EstadoNaEscadaJogador

var degrau:Degrau
var escada:Escada
var outroDegrau:Degrau

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	escada=degrau.get_parent() as Escada
	if(!jogador.estaEmEscadas):
		jogador.global_position=degrau.global_position
	jogador.set_collision_mask_value(1,false)
	jogador.estaEmEscadas=true
	
	if(degrau.sobe && degrau.degrauEsquerdo):
		if(!jogador.referenciaSprite.flip_h):
			jogador.referenciaSprite.play("SubindoEscada")
		else :
			jogador.referenciaSprite.play("DescendoEscada")
	elif(degrau.sobe && !degrau.degrauEsquerdo):
		if(jogador.referenciaSprite.flip_h):
			jogador.referenciaSprite.play("SubindoEscada")
		else :
			jogador.referenciaSprite.play("DescendoEscada")
	elif(!degrau.sobe && degrau.degrauEsquerdo):
		if(jogador.referenciaSprite.flip_h):
			jogador.referenciaSprite.play("SubindoEscada")
		else :
			jogador.referenciaSprite.play("DescendoEscada")
	else:
		if(!jogador.referenciaSprite.flip_h):
			jogador.referenciaSprite.play("SubindoEscada")
		else:
			jogador.referenciaSprite.play("DescendoEscada")

func processar_fisico(delta:float)->void:
	if(escada):
		outroDegrau=jogador.get_degrau()
		if(degrau.sobe && degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Cima")||Input.is_action_pressed("Direita")):
				jogador.flipar_jogador(true)
				jogador.referenciaSprite.play("SubindoEscada")
				mover_para_direita()
				if(outroDegrau):
					if(outroDegrau!=degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
						jogador.estaEmEscadas=false
			elif (Input.is_action_pressed("Esquerda")||Input.is_action_pressed("Baixo")):
				jogador.flipar_jogador(false)
				jogador.referenciaSprite.play("DescendoEscada")
				mover_para_esquerda()
				if(outroDegrau):
					if(outroDegrau==degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
						jogador.estaEmEscadas=false
			else:
				jogador.referenciaSprite.stop()
		if(!degrau.sobe && degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Baixo")||Input.is_action_pressed("Direita")):
				jogador.flipar_jogador(true)
				jogador.referenciaSprite.play("DescendoEscada")
				mover_para_direita()
				if(outroDegrau):
					if(outroDegrau!=degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
						jogador.estaEmEscadas=false
			elif (Input.is_action_pressed("Esquerda")||Input.is_action_pressed("Cima")):
				jogador.flipar_jogador(false)
				jogador.referenciaSprite.play("SubindoEscada")
				mover_para_esquerda()
				if(outroDegrau):
					if(outroDegrau==degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
						jogador.estaEmEscadas=false
			else:
				jogador.referenciaSprite.stop()
		if(degrau.sobe && !degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Cima")||Input.is_action_pressed("Esquerda")):
				jogador.flipar_jogador(false)
				jogador.referenciaSprite.play("SubindoEscada")
				mover_para_esquerda()
				if(outroDegrau):
					if(outroDegrau!=degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
						jogador.estaEmEscadas=false
			elif (Input.is_action_pressed("Direita")||Input.is_action_pressed("Baixo")):
				jogador.flipar_jogador(true)
				jogador.referenciaSprite.play("DescendoEscada")
				mover_para_direita()
				if(outroDegrau):
					if(outroDegrau==degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
						jogador.estaEmEscadas=false
			else:
				jogador.referenciaSprite.stop()
		if(!degrau.sobe && !degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Baixo")||Input.is_action_pressed("Esquerda")):
				jogador.flipar_jogador(false)
				jogador.referenciaSprite.play("DescendoEscada")
				mover_para_esquerda()
				if(outroDegrau):
					if(outroDegrau!=degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
						jogador.estaEmEscadas=false
			elif (Input.is_action_pressed("Direita")||Input.is_action_pressed("Cima")):
				jogador.flipar_jogador(true)
				jogador.referenciaSprite.play("SubindoEscada")
				mover_para_direita()
				if(outroDegrau):
					if(outroDegrau==degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
						jogador.estaEmEscadas=false
			else:
				jogador.referenciaSprite.stop()
		if(Input.is_action_just_pressed("Ataque")):
			var novoEstado:EstadoAtaqueNaEscadaJogador=EstadoAtaqueNaEscadaJogador.new()
			novoEstado.degrau=degrau
			novoEstado.escada=escada
			novoEstado.outroDegrau=outroDegrau
			jogador._trocar_estado(novoEstado)
			pass
		if(Input.is_action_just_pressed("SubItem")):
			if(jogador.subitem):
				if(jogador.subitem.custo<=jogador.mana):
					var novoEstado:EstadoUsandoSubItemNaEscadaJogador=EstadoUsandoSubItemNaEscadaJogador.new()
					novoEstado.degrau=degrau
					novoEstado.escada=escada
					novoEstado.outroDegrau=outroDegrau
					jogador._trocar_estado(novoEstado)

func terminar_estado()->void:
	jogador.vel=Vector2.ZERO
	jogador.velocity=jogador.vel

func mover_para_direita()->void:
	jogador.vel.x=cos(escada.angulo_da_escada)
	jogador.vel.y=-sin(escada.angulo_da_escada)
	jogador.vel*=jogador.vel_de_movimento
	jogador.velocity=jogador.vel
	jogador.move_and_slide()
func mover_para_esquerda()->void:
	jogador.vel.x=-cos(escada.angulo_da_escada)
	jogador.vel.y=+sin(escada.angulo_da_escada)
	jogador.vel*=jogador.vel_de_movimento
	jogador.velocity=jogador.vel
	jogador.move_and_slide()
