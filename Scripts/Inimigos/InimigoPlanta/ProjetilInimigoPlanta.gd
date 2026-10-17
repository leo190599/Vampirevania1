extends InimigoBase
class_name ProjetilInimigoPlanta

var vel:Vector2=Vector2.ZERO
@export var gravidade:float=5
@export var dano=1
@export var vel_rotacao:float=.1
@export var vel_max_rotacao=5

func _ready() -> void:
	vel_rotacao=RandomNumberGenerator.new().randf_range(-vel_max_rotacao,vel_max_rotacao)

func _process(delta: float) -> void:
	$Sprite2D.rotate(vel_rotacao*delta)

func _physics_process(delta: float) -> void:
	vel.y+=gravidade
	velocity=vel
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	var jogador:Jogador=area.get_parent() as Jogador
	if(jogador):
		jogador.tomar_dano(dano)
		queue_free()
	pass # Replace with function body.
