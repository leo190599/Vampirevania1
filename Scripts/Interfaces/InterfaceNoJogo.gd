extends Control
class_name InterfaceNoJogo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var noRaiz=get_tree().current_scene
	if("interface" in noRaiz):
		noRaiz.interface=self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setar_porcentagem_barra_de_vida(valor:float):
	$"Interface em jogo/Vida".value=valor
