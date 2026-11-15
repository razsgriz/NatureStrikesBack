extends CanvasLayer

@onready var tree: Node = get_node("treeAmount")
@export var main: Node

func _ready(): 
	#main.tree_pressed.connect(_increase_tree)
	pass
	
func _increase_tree(new_amount: int) -> void:
	tree.text = str(new_amount)	
