extends InimigoBase
class_name InimigoZumbi

@export var vel:float
@export var direcao:Vector2=Vector2(-1,0)

func morrer():
	super()
	queue_free()
