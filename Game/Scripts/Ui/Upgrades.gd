extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	updateLabels()
	updateButtons()
	

func updateButtons():
	pass

func updateLabels():
	$"Gold label".text = "Gold\n" + str(Gold.gold)
	$"Upgrades label".text = "Upgrades: " + str(Upgrades.upgrades) + "\nLimit Break: " + str(Upgrades.limitBreak)
