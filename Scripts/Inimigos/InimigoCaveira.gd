extends InimigoBase
class_name InimigoCaveira

var caveira:Area2D
var jogador:Jogador=null
@export var vel_y=5
@export var dano=5

func _ready() -> void:
	caveira=$Caveira
	if(vel_y<0):
		$Caveira/Sprite2D.scale.y=abs($Caveira/Sprite2D.scale.y)
	else :
		$Caveira/Sprite2D.scale.y=-abs($Caveira/Sprite2D.scale.y)

func _physics_process(delta: float) -> void:
	if(jogador):
		jogador.tomar_dano(dano)
	caveira.position.y+=vel_y
	if(caveira.position.y<=$AlturaMaxY.position.y || caveira.position.y>=$AlturaMinY.position.y):
		vel_y*=-1
		if(vel_y<0):
			$Caveira/Sprite2D.scale.y=abs($Caveira/Sprite2D.scale.y)
		else :
			$Caveira/Sprite2D.scale.y=-abs($Caveira/Sprite2D.scale.y)

func tomar_dano(dano:int):
	vida-=dano
	$AnimationPlayer.play("PiscarDano")
	if(vida<=0):
		var particulas:SangueInimigos=sangueInimigos.instantiate()
		particulas.position=caveira.global_position
		get_tree().current_scene.add_child(particulas)
		
		var novo_coletavel_vida:ColetavelVida=coletavel_vida.instantiate()
		novo_coletavel_vida.quantidade_de_vida=vida_deixada
		novo_coletavel_vida.position=caveira.global_position
		get_tree().current_scene.call_deferred("add_child",novo_coletavel_vida)
	
		queue_free()
	
func _on_caveira_area_entered(area: Area2D) -> void:
	jogador= area.get_parent() as Jogador
	pass # Replace with function body.


func _on_caveira_area_exited(area: Area2D) -> void:
	if(area.get_parent() is Jogador):
		jogador=null
	pass # Replace with function body.
