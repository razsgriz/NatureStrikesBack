extends Node2D

var selected_upgrade: bool = false;

signal upgrade_one_selected

func select_upgrade() -> void:
	if selected_upgrade == true:
		upgrade_one_selected.emit()
		PlayerData.treeIncomeIncrease += 1

func _on_button_pressed() -> void:
	selected_upgrade = true
	select_upgrade()
	$Button.hide()
	
	pass # Replace with function body.
