extends Node2D

signal pressed
var tree_amount: int = 0

func _on_claim_tree_pressed() -> void:
	$ClaimTree/pop_sound.play()
	var children = get_children()
	for child in children:
		child.hide()
		tree_amount += 1
		pressed.emit()
