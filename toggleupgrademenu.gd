extends Button

@onready var upgrademenu = get_node("../Upgrades")

func _ready():
	upgrademenu.visible = false

func _pressed():
	upgrademenu.visible = not upgrademenu.visible
