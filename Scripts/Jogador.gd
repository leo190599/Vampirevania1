extends CharacterBody2D
class_name Jogador

@export var gravidade=75
@export var vel_de_movimento=500
@export var vel_de_pulo=-2000

var subitem:SubitemObjetoScriptavel
var vel=Vector2.ZERO
var estado:EstadoBaseJogador
var area_deteccao_chao:Area2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_deteccao_chao=$Area2D
	_trocar_estado(EstadoNoArJogador.new())
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	estado.processar_fisico(delta)
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(estado!=null):
		estado.processar(delta)
	pass

func _trocar_estado(novoEstado)->void:
	if(estado):
		estado.terminar_estado()
	estado=novoEstado
	estado.iniciar_estado(self)
	
