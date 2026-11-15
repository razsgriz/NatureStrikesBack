extends Node2D

var treeIncome = 0
var greenness = 0
var treeIncomeIncrease: int = 1

func _on_claim_tree_pressed() -> void:
	treeIncome += 1

func _process(delta: float) -> void:
	greenness += roundi(treeIncome / 100)
