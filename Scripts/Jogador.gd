extends CharacterBody2D
class_name Jogador

#Variaveis de design
@export var vida:int=100
@export var vida_max:int=100
@export var mana:int=10
@export var mana_max:int=10

@export var dano:int=2

@export var gravidade=75
@export var vel_de_movimento=500
@export var vel_de_pulo=-2000
@export var subitem:SubitemObjetoScriptavel

#Variaveis de backend
var estaEmEscadas:bool=false
var podeLevarDano:bool=true
var coletavelSubItemAtalho:PackedScene
var olhando_para_direita:bool=true
var vel=Vector2.ZERO
var estado:EstadoBaseJogador
var area_deteccao_chao:Area2D
var lista_de_inimigos_atacados_no_ataque_atual:Array[InimigoBase]
var lista_de_itens_quebraveis_atacados:Array[ItemQuebravelBase]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coletavelSubItemAtalho=load("res://Prefabs/Objetos/ColetavelSubItem.tscn")
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
		$PontoInstanciaAntigoSubItem.position.x=-abs($PontoInstanciaAntigoSubItem.position.x)
	else:
		$Sprite2D.flip_h=true
		$AreaDeAtaque.position.x=-abs($AreaDeAtaque.position.x)
		$AreaDeAtaque/Sprite2D.flip_h=true
		$PontoInstanciaAntigoSubItem.position.x=abs($PontoInstanciaAntigoSubItem.position.x)
	pass
func usar_sub_item()->void:
	if(subitem!=null):
		if(mana>subitem.custo):
			mana-=subitem.custo
			var novo_subItem:SubitemBase=subitem.subitem.instantiate()
			novo_subItem.olhando_para_direita=olhando_para_direita
			novo_subItem.jogador=self
			novo_subItem.position=global_position
			get_tree().current_scene.add_child(novo_subItem)
		print(mana)
		pass

func trocar_subItem(novoSubItem:SubitemObjetoScriptavel):
	if(subitem):
		var coletavelAntigoSubItem:ColetavelSubItem=coletavelSubItemAtalho.instantiate()
		coletavelAntigoSubItem.subItem=subitem
		coletavelAntigoSubItem.position=$PontoInstanciaAntigoSubItem.global_position
		get_tree().current_scene.call_deferred("add_child",coletavelAntigoSubItem)
	subitem=novoSubItem

func tomar_dano(dano:int):
	if(podeLevarDano):
		if(!estaEmEscadas):
			_trocar_estado(EstadoTomandoDanoJogador.new())
		podeLevarDano=false
		$TimerInvencibilidade.start()
		$TimerPiscarInvencibilidade.start()
		vida-=dano
		if(vida<=0):
			morrer()
	pass

func atacar():
	var inimigo:InimigoBase
	var item_quebravel:ItemQuebravelBase
	var areas:Array[Area2D]=$AreaDeAtaque.get_overlapping_areas()
	for area in  areas:
		inimigo=area.get_parent() as InimigoBase
		if(inimigo):
			if(!lista_de_inimigos_atacados_no_ataque_atual.has(inimigo)):
				lista_de_inimigos_atacados_no_ataque_atual.append(inimigo)
				inimigo.tomar_dano(dano)
		else:
			item_quebravel=area as ItemQuebravelBase
			if(item_quebravel):
				if(!lista_de_itens_quebraveis_atacados.has(item_quebravel)):
					lista_de_itens_quebraveis_atacados.append(item_quebravel)
					if(dano<=0):
						item_quebravel.tomar_dano(1)
					else:
						item_quebravel.tomar_dano(dano)
		pass
	pass
func limpar_lista_inimigos():
	lista_de_inimigos_atacados_no_ataque_atual.clear()
	
func limpar_lista_de_itens_quebraveis():
	lista_de_itens_quebraveis_atacados.clear()

func morrer():
	print("morreu")

func _on_timer_invencibilidade_timeout() -> void:
	podeLevarDano=true
	$TimerPiscarInvencibilidade.stop()
	$Sprite2D.visible=true
	pass # Replace with function body.


func _on_timer_piscar_invencibilidade_timeout() -> void:
	$Sprite2D.visible=!$Sprite2D.visible
	pass # Replace with function body.
