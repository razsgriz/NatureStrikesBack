extends Node

@onready var treeIncome = $player_data.get("treeIncome")
signal tree_pressed(new_amount: int)

@export var trees = 1
func _ready():	
	$ui/treeAmount.text = str(treeIncome)
	var treeSpawner = $TreeSpawner


func _on_tree_spawner_timeout() -> void:
	var Children = $TreeSpawner.get_children()
	var scene = load("res://tree.tscn")
	var tree = scene.instantiate()
	var treeNode = tree.get_node("ClaimTree")
	var rng = RandomNumberGenerator.new()
	treeNode.position = Vector2(rng.randf_range(-900, 900), rng.randf_range(-900, 900))
	$TreeSpawner.add_child(tree)

	#var popup_text = Label.new()
	#popup_text.scale = Vector2(8, 8)
	#popup_text.text = "+" + str(treeIncome)
	#treeNode.add_child(popup_text)
	#popup_text.position = Vector2(100, -350)
	#await delete_tree(treeNode)
	
	#var claimTree = Button.new()
	treeNode.pressed.connect(
		func() -> void:
			treeNode.hide()
			treeIncome += 1
			$ui/treeAmount.text = str(treeIncome)
			
	)
	#treeNode.add_child(claimTree)
	#claimTree.scale = Vector2(20, 20)
	#claimTree.position = Vector2(0, -100)
	await delete_tree(treeNode)
	#
#func tree_claimed(treeNode):
	#treeNode.hide()
	#treeIncome += 1
	#print(str(treeIncome))
	#$treeAmount.text = str(treeIncome)
	#pass

func delete_tree(treeNode):
	await get_tree().create_timer(5).timeout
	treeNode.queue_free()

func _on_claim_tree_pressed() -> void:
	tree_pressed.emit(treeIncome)
	print("thingy")
	$ui/treeAmount.text = str($player_data.get("treeIncome"))
