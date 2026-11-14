extends Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_event_generator_timeout() -> void:
	var rng = RandomNumberGenerator.new()
	var randomEventNo = rng.randi_range(0, 1)
	if randomEventNo == 0:
		print("Tsunami")
	elif randomEventNo == 1:
		print("Tornado")
