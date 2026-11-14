extends CanvasLayer

@onready var tree: Node = get_node("treeAmount")
@export var main: Node

func _ready():
	tree.text = str(main.treeIncome.value)
	main.tree_pressed.connect(_increase_tree)
	
func _increase_tree(new_amount: int) -> void:
	tree.text = str(new_amount)	