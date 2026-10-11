extends SubitemBase
class_name Machado

@export var vel_x:float=10
@export var gravidade:float =9.81
@export var vel_y:float=-9.81
@export var vel_rotacao:float=.05
@export var dano=5

var vetor_movimento:Vector2

func _ready() -> void:
	vetor_movimento=Vector2.ZERO
	if(olhando_para_direita):
		vetor_movimento.x=vel_x
	else :
		vel_rotacao*=-1
		vetor_movimento.x=-vel_x
	vetor_movimento.y=vel_y

func _physics_process(delta: float) -> void:
	rotate(vel_rotacao)
	position+=vetor_movimento
	vetor_movimento.y+=gravidade


func _on_area_entered(area: Area2D) -> void:
	var inimigo:InimigoBase=area.get_parent() as InimigoBase
	if(inimigo):
		inimigo.tomar_dano(dano)
		queue_free()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.
