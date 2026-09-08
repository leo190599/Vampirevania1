extends EstadoBaseJogador
class_name EstadoAtaqueJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.velocity=Vector2.ZERO
	iniciar_ataque()

func processar_fisico(delta:float)->void:
	terminar_ataque()

func iniciar_ataque()->void:
	print("Ataque")
func terminar_ataque()->void:
	print("Terminado ataque")
	if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
		jogador._trocar_estado(EstadoAndandoJogador.new())
	else:
		jogador._trocar_estado(EstadoIdleJogador.new())
