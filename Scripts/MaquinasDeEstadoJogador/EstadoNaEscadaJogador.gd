extends EstadoBaseJogador
class_name EstadoNaEscadaJogador

var degrau:Degrau
var escada:Escada
var outroDegrau:Degrau

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	escada=degrau.get_parent() as Escada
	jogador.global_position=degrau.global_position
	
func processar_fisico(delta:float)->void:
	if(escada):
		if(degrau.sobe && degrau.degrauEsquerdo):
			if(Input.is_action_pressed("Cima")||Input.is_action_pressed("Direita")):
				jogador.referenciaSprite.flip_h=false
				jogador.vel.x=cos(escada.angulo_da_escada)
				jogador.vel.y=sin(escada.angulo_da_escada)
				jogador.vel*=jogador.vel_de_movimento
				jogador.velocity=jogador.vel
				jogador.move_and_slide()
			outroDegrau=jogador.get_degrau()
			if(outroDegrau):
				if(outroDegrau!=degrau):
					jogador._trocar_estado(EstadoIdleJogador.new())
				
func terminar_estado()->void:
	jogador.vel=Vector2.ZERO
	jogador.velocity=jogador.vel
