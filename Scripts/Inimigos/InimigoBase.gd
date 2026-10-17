extends CharacterBody2D
class_name InimigoBase

@export var vida:int=10
@export var vida_deixada:int=1
var olhando_para_direita:bool=false
var ativado:bool=false
var coletavel_vida:PackedScene=load("res://Prefabs/Objetos/ColetavelVida.tscn")
var sangueInimigos:PackedScene=load("res://Prefabs/Objetos/Particulas/SangueInimigos.tscn")


func causar_dano(jogador:Jogador,dano:int):
	jogador.tomar_dano(dano)
	pass

func tomar_dano(dano:int):
	vida-=dano
	if(vida<=0):
		morrer()
	pass
	
func morrer():
	var particulas:SangueInimigos=sangueInimigos.instantiate()
	particulas.position=position
	get_tree().current_scene.add_child(particulas)
	
	var novo_coletavel_vida:ColetavelVida=coletavel_vida.instantiate()
	novo_coletavel_vida.quantidade_de_vida=vida_deixada
	novo_coletavel_vida.position=position
	get_tree().current_scene.call_deferred("add_child",novo_coletavel_vida)
	pass
