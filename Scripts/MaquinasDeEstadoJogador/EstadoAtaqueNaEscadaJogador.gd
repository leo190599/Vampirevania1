extends EstadoBaseJogador
class_name EstadoAtaqueNaEscadaJogador

var atacando=false
var degrau:Degrau
var escada:Escada
var outroDegrau:Degrau

func iniciar_estado(parametrojogador:Jogador)->void:
	super(parametrojogador)
	jogador.referenciaSpriteAtaque.visible=true
	jogador.referenciaSpriteAtaque.play("Ataque")
	
	jogador.referenciaSprite.play("AtacandoNaEscada")
	jogador.velocity=Vector2.ZERO
	iniciar_ataque()

func processar_fisico(delta:float)->void:
	if(atacando):
		jogador.atacar()

func evento_fim_da_animacao()->void:
	terminar_ataque()

func terminar_estado()->void:
	super()
	atacando=false
	jogador.referenciaSpriteAtaque.visible=false
	jogador.limpar_lista_inimigos()
	jogador.limpar_lista_de_itens_quebraveis()

func iniciar_ataque()->void:
	atacando=true
func terminar_ataque()->void:
	var novoEstado:EstadoNaEscadaJogador=EstadoNaEscadaJogador.new()
	novoEstado.degrau=degrau
	novoEstado.escada=escada
	novoEstado.outroDegrau=outroDegrau
	jogador._trocar_estado(novoEstado)
