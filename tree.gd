extends Node2D

class_name tree

var trees: int = 1

func tree() -> void:
	add_to_group("tree")

func _on_button_pressed() -> void:
	hide()
	print('should be clicked rn')
	trees += 1
	pass # Replace with function body.
