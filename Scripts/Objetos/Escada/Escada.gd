extends Node2D
class_name Escada

var angulo_da_escada:float

func _ready() -> void:
	angulo_da_escada=atan2($DegrauEsquerdo.position.y-$DegrauDireito.position.y,
	$DegrauDireito.position.x-$DegrauEsquerdo.position.x)
	if($DegrauEsquerdo.position.y<$DegrauDireito.position.y):
		$DegrauEsquerdo.sobe=false
		$DegrauDireito.sobe=true
	else:
		$DegrauEsquerdo.sobe=true
		$DegrauDireito.sobe=false
