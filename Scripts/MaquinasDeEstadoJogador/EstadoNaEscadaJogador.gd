extends EstadoBaseJogador
class_name EstadoNaEscadaJogador

var degrau:Degrau
var escada:Escada
var outroDegrau:Degrau

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	escada=degrau.get_parent() as Escada
	jogador.global_position=degrau.global_position
	jogador.set_collision_mask_value(1,false)
	jogador.estaEmEscadas=true
	
func processar_fisico(delta:float)->void:
	if(escada):
		outroDegrau=jogador.get_degrau()
		if(degrau.sobe && degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Cima")||Input.is_action_pressed("Direita")):
				jogador.referenciaSprite.flip_h=false
				mover_para_direita()
				if(outroDegrau):
					if(outroDegrau!=degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
			elif (Input.is_action_pressed("Esquerda")||Input.is_action_pressed("Baixo")):
				jogador.referenciaSprite.flip_h=true
				mover_para_esquerda()
				if(outroDegrau):
					if(outroDegrau==degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
		if(!degrau.sobe && degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Baixo")||Input.is_action_pressed("Direita")):
				jogador.referenciaSprite.flip_h=false
				mover_para_direita()
				if(outroDegrau):
					if(outroDegrau!=degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
			elif (Input.is_action_pressed("Esquerda")||Input.is_action_pressed("Cima")):
				jogador.referenciaSprite.flip_h=true
				mover_para_esquerda()
				if(outroDegrau):
					if(outroDegrau==degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
		if(degrau.sobe && !degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Cima")||Input.is_action_pressed("Esquerda")):
				jogador.referenciaSprite.flip_h=true
				mover_para_esquerda()
				if(outroDegrau):
					if(outroDegrau!=degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
			elif (Input.is_action_pressed("Direita")||Input.is_action_pressed("Baixo")):
				jogador.referenciaSprite.flip_h=false
				mover_para_direita()
				if(outroDegrau):
					if(outroDegrau==degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
		if(!degrau.sobe && !degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Baixo")||Input.is_action_pressed("Esquerda")):
				jogador.referenciaSprite.flip_h=true
				mover_para_esquerda()
				if(outroDegrau):
					if(outroDegrau!=degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())
			elif (Input.is_action_pressed("Direita")||Input.is_action_pressed("Cima")):
				jogador.referenciaSprite.flip_h=false
				mover_para_direita()
				if(outroDegrau):
					if(outroDegrau==degrau):
						jogador._trocar_estado(EstadoIdleJogador.new())


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
