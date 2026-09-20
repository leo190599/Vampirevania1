extends Node
class_name Escada

var angulo_da_escada:float

func _ready() -> void:
	angulo_da_escada=atan2($DegrauDireito.position.y-$DegrauEsquerdo.position.y,
	$DegrauDireito.position.x-$DegrauEsquerdo.position.x)
	print(rad_to_deg(angulo_da_escada))
