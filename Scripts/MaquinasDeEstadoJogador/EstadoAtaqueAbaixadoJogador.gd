extends EstadoBaseJogador
class_name EstadoAtaqueAbaixadoJogador

var atacando:bool

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	iniciar_ataque()
	
func processar_fisico(delta:float)->void:
	if(atacando):
		jogador.atacar()
	terminar_ataque()
	if(Input.is_action_pressed("Baixo")):
		jogador._trocar_estado(EstadoAbaixadoJogador.new())
	elif(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
		jogador._trocar_estado(EstadoAndandoJogador.new())
	else:
		jogador._trocar_estado(EstadoIdleJogador.new())

func terminar_estado()->void:
	jogador.limpar_lista_inimigos()

func iniciar_ataque()->void:
	atacando=true
	pass
	
func terminar_ataque()->void:
	atacando=false
	pass
