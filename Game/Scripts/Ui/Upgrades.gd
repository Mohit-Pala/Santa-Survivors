extends Control

var healthAmt
var regenAmt
var curseAmt
var amountAmt
var speedAmt
var greedAmt
var projSpeedAmt
var projTimeAmt
var currGold
var limBrk

# Called when the node enters the scene tree for the first time.
func _ready():
	updateAll()


func updateAmts():
	# gold
	currGold = Gold.gold
	
	# meta upgrades
	limBrk = Upgrades.limitBreak
	
	# upgrades 
	healthAmt = 100 + Upgrades.health * 10 + Upgrades.upgrades * 30
	regenAmt = 300 + Upgrades.regen * 10 + Upgrades.upgrades * 30
	curseAmt = 500 + Upgrades.curse * 10 + Upgrades.upgrades * 10
	amountAmt = 0 + Upgrades.amount * 50 + Upgrades.upgrades * 50
	speedAmt = 100 + Upgrades.speed * 10 + Upgrades.upgrades * 30
	greedAmt = 0 + Upgrades.greed * 50 + Upgrades.upgrades * 30
	projSpeedAmt = 500 + Upgrades.curse * 10 + Upgrades.upgrades * 10
	projTimeAmt = 0 + Upgrades.amount * 50 + Upgrades.upgrades * 50


func updateButtons():
	$Health.text = "Health: $" + str(healthAmt) + "\nBought: " + str(Upgrades.health)
	$Regen.text = "Regen: $" + str(regenAmt) + "\nBought: " + str(Upgrades.regen)
	$Curse.text = "Curse: $" + str(curseAmt) + "\nBought: " + str(Upgrades.curse)
	$Amount.text = "Amount: $" + str(amountAmt) + "\nBought: " + str(Upgrades.amount)
	$Speed.text = "Speed: $" + str(speedAmt) + "\nBought: " + str(Upgrades.speed)
	$Greed.text = "Greed: $" + str(greedAmt) + "\nBought: " + str(Upgrades.greed)
	$"Projectile speed".text = "Projectile Speed: $" + str(projSpeedAmt) + "\nBought: " + str(Upgrades.projectileSpeed)
	$"Projectile timeout".text = "Timeout: $" + str(projTimeAmt) + "\nBought: " + str(Upgrades.projectileTimeout)
	$"Limit break".text = "LIMIT BREAK: $100,000\nBought: " + str(Upgrades.limitBreak) 

func updateLabels():
	$"Gold label".text = "Gold\n" + str(Gold.gold)
	$"Upgrades label".text = "Upgrades: " + str(Upgrades.upgrades) + "\nLimit Break: " + str(Upgrades.limitBreak)


func updateAll():
	updateAmts()
	updateLabels()
	updateButtons()


func _on_health_pressed():
	if(currGold >= healthAmt):
		if(Upgrades.limitBreak):
			Gold.reduceGold(healthAmt)
			Upgrades.changeHealth(Upgrades.health + 1)
			Upgrades.changeUpgrades(Upgrades.upgrades + 1)
		else:
			if(Upgrades.health >= 50):
				pass
			else:
				Gold.reduceGold(healthAmt)
				Upgrades.changeHealth(Upgrades.health + 1)
				Upgrades.changeUpgrades(Upgrades.upgrades + 1)
	else:
		pass
	updateAll()


func _on_regen_pressed():
	if(currGold >= regenAmt):
		if(Upgrades.limitBreak):
			Gold.reduceGold(regenAmt)
			Upgrades.changeRegen(Upgrades.regen + 1)
			Upgrades.changeUpgrades(Upgrades.upgrades + 1)
		else:
			if(Upgrades.regen >= 50):
				pass
			else:
				Gold.reduceGold(regenAmt)
				Upgrades.changeRegen(Upgrades.regen + 1)
				Upgrades.changeUpgrades(Upgrades.upgrades + 1)
	else:
		pass
	updateAll()


func _on_curse_pressed():
	if(currGold >= curseAmt):
		if(Upgrades.limitBreak):
			Gold.reduceGold(curseAmt)
			Upgrades.changeCurse(Upgrades.curse + 1)
			Upgrades.changeUpgrades(Upgrades.upgrades + 1)
		else:
			if(Upgrades.curse >= 50):
				pass
			else:
				Gold.reduceGold(curseAmt)
				Upgrades.changeCurse(Upgrades.curse + 1)
				Upgrades.changeUpgrades(Upgrades.upgrades + 1)
	else:
		pass
	updateAll()


func _on_amount_pressed():
	if(currGold >= amountAmt):
		if(Upgrades.limitBreak):
			Gold.reduceGold(amountAmt)
			Upgrades.changeAmount(Upgrades.amount + 1)
			Upgrades.changeUpgrades(Upgrades.upgrades + 1)
		else:
			if(Upgrades.curse >= 50):
				pass
			else:
				Gold.reduceGold(amountAmt)
				Upgrades.changeAmount(Upgrades.amount + 1)
				Upgrades.changeUpgrades(Upgrades.upgrades + 1)
	else:
		pass
	updateAll()


func _on_speed_pressed():
	if(currGold >= speedAmt):
		if(Upgrades.limitBreak):
			Gold.reduceGold(speedAmt)
			Upgrades.changeSpeed(Upgrades.speed + 1)
			Upgrades.changeUpgrades(Upgrades.upgrades + 1)
		else:
			if(Upgrades.curse >= 50):
				pass
			else:
				Gold.reduceGold(speedAmt)
				Upgrades.changeSpeed(Upgrades.speed + 1)
				Upgrades.changeUpgrades(Upgrades.upgrades + 1)
	else:
		pass
	updateAll()


func _on_greed_pressed():
	if(currGold >= greedAmt):
		if(Upgrades.limitBreak):
			Gold.reduceGold(greedAmt)
			Upgrades.changeGreed(Upgrades.greed + 1)
			Upgrades.changeUpgrades(Upgrades.upgrades + 1)
		else:
			if(Upgrades.curse >= 50):
				pass
			else:
				Gold.reduceGold(greedAmt)
				Upgrades.changeGreed(Upgrades.greed + 1)
				Upgrades.changeUpgrades(Upgrades.upgrades + 1)
	else:
		pass
	updateAll()


func _on_projectile_speed_pressed():
	if(currGold >= projSpeedAmt):
		if(Upgrades.limitBreak):
			Gold.reduceGold(projSpeedAmt)
			Upgrades.changeProjectileSpeed(Upgrades.projectileSpeed + 1)
			Upgrades.changeUpgrades(Upgrades.upgrades + 1)
		else:
			if(Upgrades.curse >= 50):
				pass
			else:
				Gold.reduceGold(projSpeedAmt)
				Upgrades.changeProjectileSpeed(Upgrades.projectileSpeed + 1)
				Upgrades.changeUpgrades(Upgrades.upgrades + 1)
	else:
		pass
	updateAll()


func _on_projectile_timeout_pressed():
	if(currGold >= projTimeAmt):
		if(Upgrades.limitBreak):
			Gold.reduceGold(projTimeAmt)
			Upgrades.changeProjectileTimeout(Upgrades.projectileTimeout + 1)
			Upgrades.changeUpgrades(Upgrades.upgrades + 1)
		else:
			if(Upgrades.curse >= 50):
				pass
			else:
				Gold.reduceGold(projTimeAmt)
				Upgrades.changeProjectileTimeout(Upgrades.projectileTimeout + 1)
				Upgrades.changeUpgrades(Upgrades.upgrades + 1)
	else:
		pass
	updateAll()


func _on_limit_break_pressed():
	if(currGold > 100000):
		Gold.reduceGold(100000)
		Upgrades.changelimitBreak(true)
	updateAll()


func _on_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")


func _on_to_weapon_shop_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Shop Menu.tscn")
