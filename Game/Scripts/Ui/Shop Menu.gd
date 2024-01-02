extends Control

var currGold
# Called when the node enters the scene tree for the first time.
func _ready():
	update()

func update():
	currGold = Gold.gold
	$"Gold label".text = "Gold\n" + str(currGold)
	if(Shop.snowball):
		$Snowball.text = "Snowball: Unlocked"
	if(Shop.presents):
		$Presents.text = "Presents: Unlocked"
	if(Shop.star):
		$Star.text = "Star: unlocked"
	if(Shop.snowShield):
		$"Snow shield".text = "Snow shield: unlocked"
	if(Shop.healingTree):
		$"Healing tree".text = "Healing tree: unlocked"

func _on_snowball_pressed():
	if(currGold > 10000):
		Gold.reduceGold(10000)
		Shop.unlockSnowball()
	update()


func _on_presents_pressed():
	if(currGold > 30000):
		Gold.reduceGold(30000)
		Shop.unlockPresents()
	update()


func _on_star_pressed():
	if(currGold > 50000):
		Gold.reduceGold(50000)
		Shop.unlockStar()
	update()


func _on_snow_shield_pressed():
	if(currGold > 100000):
		Gold.reduceGold(100000)
		Shop.unlockSnowShield()
	update()


func _on_healing_tree_pressed():
	if(currGold > 80000):
		Gold.reduceGold(80000)
		Shop.unlockHealingTree()
	update()


func _on_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")


func _on_to_upgrade_menu_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Upgrades.tscn")
