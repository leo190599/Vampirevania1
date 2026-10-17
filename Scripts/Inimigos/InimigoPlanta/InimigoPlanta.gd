extends InimigoBase
class_name InimigoPlanta

@export var projetil:PackedScene
var gerador_de_numeros_aleatorios:RandomNumberGenerator
@export var vel_x_min_projetil:float
@export var vel_x_max_projetil:float

@export var vel_y_min_projetil:float
@export var vel_y_max_projetil:float

func _ready() -> void:
	gerador_de_numeros_aleatorios=RandomNumberGenerator.new()
	$Sprite2D.play("idle")

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	$Timer.start()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$Timer.stop()
	pass # Replace with function body.

func spawnar_projeteis():
	var novoProjetil:ProjetilInimigoPlanta=projetil.instantiate()
	novoProjetil.position=$PontoDeSpawn1.global_position
	novoProjetil.vel=Vector2(gerador_de_numeros_aleatorios.randf_range(-vel_x_max_projetil,-vel_x_min_projetil),
	gerador_de_numeros_aleatorios.randf_range(-vel_y_max_projetil,-vel_y_min_projetil))
	get_tree().current_scene.add_child(novoProjetil)
	
	novoProjetil=projetil.instantiate()
	novoProjetil.position=$PontoDeSpawn2.global_position
	novoProjetil.vel=Vector2(gerador_de_numeros_aleatorios.randf_range(-vel_x_max_projetil,-vel_x_min_projetil),
	gerador_de_numeros_aleatorios.randf_range(-vel_y_max_projetil,-vel_y_min_projetil))
	get_tree().current_scene.add_child(novoProjetil)
	
	novoProjetil=projetil.instantiate()
	novoProjetil.position=$PontoDeSpawn3.global_position
	novoProjetil.vel=Vector2(gerador_de_numeros_aleatorios.randf_range(vel_x_min_projetil,vel_x_max_projetil),
	gerador_de_numeros_aleatorios.randf_range(-vel_y_max_projetil,-vel_y_min_projetil))
	get_tree().current_scene.add_child(novoProjetil)
	
	novoProjetil=projetil.instantiate()
	novoProjetil.position=$PontoDeSpawn4.global_position
	novoProjetil.vel=Vector2(gerador_de_numeros_aleatorios.randf_range(vel_x_min_projetil,vel_x_max_projetil),
	gerador_de_numeros_aleatorios.randf_range(-vel_y_max_projetil,-vel_y_min_projetil))
	get_tree().current_scene.add_child(novoProjetil)
	
func tomar_dano(dano:int):
	vida-=dano
	$AnimationPlayer.play("PiscarDano")
	if(vida<=0):
		morrer()
		queue_free()

func _on_timer_timeout() -> void:
	$Sprite2D.play("Ataque")
	spawnar_projeteis()
	pass # Replace with function body.
