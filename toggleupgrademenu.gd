extends Button

func openupgrade ():
	var upgrademenu = get_node("Upgrades")
	var vis = upgrademenu.Visibility
	if vis == false:
		vis = true
	if vis == true:
		vis = false
