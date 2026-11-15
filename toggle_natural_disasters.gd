extends Button

@onready var disastermenu: Node = get_node("../naturaldisastersmenu")

func _ready():
	disastermenu.visible = false

func _pressed():
	disastermenu.visible = not disastermenu.visible
