extends EstadoBaseJogador
class_name EstadoIdleJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.vel.x=0
	jogador.velocity=jogador.vel

func processar_fisico(delta:float)->void:
	if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
		jogador._trocar_estado(EstadoAndandoJogador.new())
	if(Input.is_action_just_pressed("pulo")):
		jogador.vel.y=jogador.vel_de_pulo
		jogador._trocar_estado(EstadoNoArJogador.new())
	if(Input.is_action_just_pressed("Ataque")):
		jogador._trocar_estado(EstadoAtaqueJogador.new())
