extends Node2D


func _on_claim_tree_pressed() -> void:
	var children = get_children()
	for child in children:
		child.hide()
