extends EstadoBaseJogador
class_name EstadoTomandoDanoNaEscadaJogador

var degrau:Degrau
var escada:Escada
var outroDegrau:Degrau

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.referenciaSprite.play("TomandoDanoNaEscada")
	pass
func processar_fisico(delta:float)->void:
	if(jogador.podeLevarDano):
		var novoEstado:EstadoNaEscadaJogador=EstadoNaEscadaJogador.new()
		novoEstado.degrau=degrau
		novoEstado.escada=escada
		novoEstado.outroDegrau=outroDegrau
		jogador._trocar_estado(novoEstado)
