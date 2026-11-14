extends Node

class tree_income:
	var value = 1

static var treeIncome = tree_income.new()

@export var trees = 1
func _ready():
	$treeAmount.text = str(treeIncome.value)
	var treeSpawner = $TreeSpawner


func _on_tree_spawner_timeout() -> void:
	var Children = $TreeSpawner.get_children()
	var scene = load("res://tree.tscn")
	var tree = scene.instantiate()
	var treeNode = tree.get_node("Sprite2D")
	var rng = RandomNumberGenerator.new()
	treeNode.position = Vector2(rng.randf_range(-900, 900), rng.randf_range(-900, 900))
	$TreeSpawner.add_child(tree)

	#var popup_text = Label.new()
	#popup_text.scale = Vector2(8, 8)
	#popup_text.text = "+" + str(treeIncome.value)
	#treeNode.add_child(popup_text)
	#popup_text.position = Vector2(100, -350)
	#await delete_tree(treeNode)

	var claimTree = Button.new()
	claimTree.pressed.connect(
			func() -> void:
				claimTree.hide()
				treeNode.hide()
				treeIncome.value += 1
				print(str(treeIncome.value))
				$treeAmount.text = str(treeIncome.value)
	)
	claimTree.scale = Vector2(5, 5)
	claimTree.position = treeNode.position + Vector2(200, 100)
	add_child(claimTree)

func tree_claimed(treeNode):
	treeNode.hide()
	treeIncome.value += 1
	print(str(treeIncome.value))
	$treeAmount.text = str(treeIncome.value)
	pass

func delete_tree(treeNode):
	await get_tree().create_timer(5).timeout
	treeNode.queue_free()
