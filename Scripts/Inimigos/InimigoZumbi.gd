extends InimigoBase
class_name InimigoZumbi

@export var vel:float=200
@export var dano=5
@export var direcao:Vector2=Vector2(1,0)

var jogador:Jogador=null

func _ready() -> void:
	$TimerMudarDeDirecao.paused=true

func morrer():
	super()
	queue_free()

func _physics_process(delta: float) -> void:
	if(ativado):
		if(olhando_para_direita):
			move_and_collide(vel*direcao*delta)
		else:
			move_and_collide(-vel*direcao*delta)
		if(jogador):
			jogador.tomar_dano(dano)

	

func _on_area_de_ataque_area_entered(area: Area2D) -> void:
	jogador= area.get_parent() as Jogador
	pass # Replace with function body.


func _on_area_de_ataque_area_exited(area: Area2D) -> void:
	if(area.get_parent() is Jogador):
		jogador=null
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	$TimerMudarDeDirecao.paused=false
	ativado=true
	pass # Replace with function body.


func _on_timer_mudar_de_direcao_timeout() -> void:
	direcao*=-1
	$Sprite2D.flip_h=!$Sprite2D.flip_h
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$TimerMudarDeDirecao.paused=true
	pass # Replace with function body.
