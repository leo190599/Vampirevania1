extends CharacterBody2D
class_name InimigoBase

@export var vida:int=10

func causar_dano(jogador:Jogador,dano:int):
	jogador.tomar_dano(dano)
	pass

func tomar_dano(dano:int):
	vida-=dano
	if(vida<=0):
		morrer()
	pass
	
func morrer():
	pass
