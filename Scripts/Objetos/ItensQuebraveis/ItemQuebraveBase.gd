extends Area2D
class_name ItemQuebravelBase

var vida:int = 1

func tomar_dano(dano:int)->void:
	vida-=dano
	if(vida<=0):
		quebrar()
	pass

func quebrar()->void:
	pass
