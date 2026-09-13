extends ItemQuebravelBase
class_name ItemQuebravelComItem

@export var item:PackedScene
@export var subItem:SubitemObjetoScriptavel

func quebrar()->void:
	if(item):
		var novoItem:Node2D =item.instantiate()
		var itemColetavelSubItem:ColetavelSubItem=novoItem as ColetavelSubItem
		if(itemColetavelSubItem && subItem):
			itemColetavelSubItem.subItem=subItem
		novoItem.position=global_position
		get_tree().current_scene.call_deferred("add_child",novoItem)
	queue_free()
