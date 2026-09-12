extends EstadoBaseJogador
class_name EstadoAtaqueJogador

var atacando=false

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.velocity=Vector2.ZERO
	iniciar_ataque()

func processar_fisico(delta:float)->void:
	if(atacando):
		jogador.atacar()
	terminar_ataque()

func terminar_estado()->void:
	super()
	jogador.limpar_lista_inimigos()

func iniciar_ataque()->void:
	atacando=true
func terminar_ataque()->void:
	atacando=false
	if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
		jogador._trocar_estado(EstadoAndandoJogador.new())
	else:
		jogador._trocar_estado(EstadoIdleJogador.new())
