extends Node

signal tree_pressed(new_amount: int)

@export var trees = 1
func _ready():	
	$ui/treeAmount.text = str(PlayerData.treeIncome)
	var treeSpawner = $TreeSpawner


func _on_tree_spawner_timeout() -> void:
	var Children = $TreeSpawner.get_children()
	var scene = load("res://tree.tscn")
	var tree = scene.instantiate()
	var treeNode = tree.get_node("ClaimTree")
	var rng = RandomNumberGenerator.new()
	var lpick = rng.randi_range(0, 5)
	var location = Vector2(0, 0)
	if lpick == 0:
		location = Vector2(rng.randf_range(-902, -701), rng.randf_range(-487, -455))
	elif lpick == 1:
		location = Vector2(rng.randf_range(-710, -549), rng.randf_range(-426, -266))
	elif lpick == 2:
		location = Vector2(rng.randf_range(-367, -321), rng.randf_range(15, 108))
	elif lpick == 3:
		location = Vector2(rng.randf_range(-168, 61), rng.randf_range(0, 143))
	elif lpick == 4:
		location = Vector2(rng.randf_range(14, 738), rng.randf_range(-216, -125))
	elif lpick == 5:
		location = Vector2(rng.randf_range(352, 789), rng.randf_range(305, 140))
	treeNode.position = location
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
			PlayerData.treeIncome += PlayerData.treeIncomeIncrease
			$green_bar.position += Vector2(1.78, 0)
			$ui/treeAmount.text = str(PlayerData.treeIncome)
			
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
	tree_pressed.emit(PlayerData.treeIncome)
	print("thingy")
	$ui/treeAmount.text = str($player_data.get("treeIncome"))
