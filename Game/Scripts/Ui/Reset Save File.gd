extends Control

var timeRemain
const saveCountdown = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	resetValues()
	saveGame()
	$"Saving Bar".max_value = saveCountdown
	$"Exit Game".start(saveCountdown)

func _physics_process(_delta):
	$"Saving Bar".set_value($"Exit Game".get_time_left())
	pass
	
func resetValues():
	# gold
	Gold.changeGold(0)
	
	# meta upgrades
	Upgrades.changeUpgrades(0)
	Upgrades.changelimitBreak(false)
	
	# upgrades
	Upgrades.changeHealth(0)
	Upgrades.changeRegen(0)
	Upgrades.changeCurse(0)
	Upgrades.changeAmount(0)
	Upgrades.changeSpeed(0)
	Upgrades.changeGreed(0)
	Upgrades.changeProjectileSpeed(0)
	Upgrades.changeProjectileTimeout(0)
	
	# weapons

func saveGame():
	var config = ConfigFile.new()
	
	# gold
	config.set_value("santa", "gold", Gold.gold)
	
	# meta upgrades
	config.set_value("santa", "upgrades", Upgrades.upgrades)
	config.set_value("santa", "limitBreak", Upgrades.limitBreak)

	# upgrades
	config.set_value("santa", "healthUpgrade", Upgrades.health)
	config.set_value("santa", "regenUpgrade", Upgrades.regen)
	config.set_value("santa", "curse", Upgrades.curse)
	config.set_value("santa", "amount", Upgrades.amount)
	config.set_value("santa", "speed", Upgrades.speed)
	config.set_value("santa", "greed", Upgrades.greed)
	config.set_value("santa", "projSpeed", Upgrades.projectileSpeed)
	config.set_value("santa", "projTimeout", Upgrades.projectileTimeout)
	
	# weapons
	config.set_value("santa", "snowball", Shop.snowball)
	config.set_value("santa", "presents", Shop.presents)
	config.set_value("santa", "star", Shop.star)
	config.set_value("santa", "snowShield", Shop.snowShield)
	config.set_value("santa", "healingTree", Shop.healingTree)
	
	config.save("user://santa-survivor.cfg")


func _on_exit_game_timeout():
	get_tree().quit()
