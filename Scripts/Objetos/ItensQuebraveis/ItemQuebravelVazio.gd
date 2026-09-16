extends ItemQuebravelBase
class_name ItemQuebravelVazio

func _ready() -> void:
	$Sprite2D.play("default")

func quebrar()->void:
	queue_free()
