extends EstadoBaseJogador
class_name  EstadoUsandoSubItemNaEscadaJogador

var degrau:Degrau
var escada:Escada
var outroDegrau:Degrau

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.referenciaSprite.play("UsandoSubItemNaEscada")
	jogador.usar_sub_item()

func evento_fim_da_animacao()->void:
	super()
	var novoEstado:EstadoNaEscadaJogador=EstadoNaEscadaJogador.new()
	novoEstado.degrau=degrau
	novoEstado.escada=escada
	novoEstado.outroDegrau=outroDegrau
	jogador._trocar_estado(novoEstado)
