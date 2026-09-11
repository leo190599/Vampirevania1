extends CharacterBody2D
class_name Jogador

#Variaveis de design
@export var gravidade=75
@export var vel_de_movimento=500
@export var vel_de_pulo=-2000
@export var subitem:SubitemObjetoScriptavel
@export var mana:int=10
@export var mana_max:int=10

#Variaveis de backend
var olhando_para_direita:bool=true
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
	
func flipar_jogador(direita:bool)->void:
	if(direita):
		$Sprite2D.flip_h=false
		$AreaDeAtaque.position.x=abs($AreaDeAtaque.position.x)
		$AreaDeAtaque/Sprite2D.flip_h=false
	else:
		$Sprite2D.flip_h=true
		$AreaDeAtaque.position.x=-abs($AreaDeAtaque.position.x)
		$AreaDeAtaque/Sprite2D.flip_h=true
		
	pass
func usar_sub_item()->void:
	if(subitem!=null):
		if(mana>subitem.custo):
			mana-=subitem.custo
			var novo_subItem:SubitemBase=subitem.subitem.instantiate()
			novo_subItem.olhando_para_direita=olhando_para_direita
			novo_subItem.position=global_position
			get_tree().current_scene.add_child(novo_subItem)
		print(mana)
		pass
