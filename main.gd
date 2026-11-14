extends Node

class tree_income:
	var value = 1

@export var trees = 1
func _ready():	
	var treeSpawner = $TreeSpawner


func _on_tree_spawner_timeout() -> void:
	print("thing")
	var Children = $TreeSpawner.get_children()
	for child in Children:
		child.queue_free()
	var scene = load("res://tree.tscn")
	var tree = scene.instantiate()
	var treeNode = tree.get_node("Sprite2D")
	var rng = RandomNumberGenerator.new()
	treeNode.position = Vector2(rng.randf_range(-900, 900), rng.randf_range(-900, 900))
	$TreeSpawner.add_child(tree)

	var popup_text = Label.new()
	popup_text.scale = Vector2(8, 8)
	popup_text.text = "+1"
	popup_text.position = treeNode.position + Vector2(100, -350)
	treeNode.add_child(popup_text)
