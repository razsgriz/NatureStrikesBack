extends CanvasLayer

@onready var tree: Node = get_node("treeAmount")

func _ready(): 
	pass

	
func _increase_tree(new_amount: int) -> void:
	tree.text = str(new_amount)	
