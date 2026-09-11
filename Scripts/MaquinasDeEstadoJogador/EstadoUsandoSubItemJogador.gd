extends EstadoBaseJogador
class_name EstadoUsandoSubItemJogador

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.vel=Vector2.ZERO
	jogador.velocity=Vector2.ZERO
	iniciar_uso_subItem()

func iniciar_uso_subItem():
	jogador.usar_sub_item()
	terminar_uso_subItem()
	pass
func terminar_uso_subItem():
	if(Input.is_action_pressed("Direita")||Input.is_action_pressed("Esquerda")):
		jogador._trocar_estado(EstadoAndandoJogador.new())
	elif(Input.is_action_pressed("Baixo")):
		jogador._trocar_estado(EstadoAbaixadoJogador.new())
	else:
		jogador._trocar_estado(EstadoIdleJogador.new())
	pass
