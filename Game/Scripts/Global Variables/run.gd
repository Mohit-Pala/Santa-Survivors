extends Node

# main stats
var charHealth = 0
var charMaxHealth = 0
var enemiesKilled = 0

var snowShieldHealth = 5 + Upgrades.amount

# weapons
var blackHoleActive = false
var starActive = false
var snowShieldActive = false

# char pos
var charPosx = 0
var charPosy = 0

# is char alive
var alive = true

# main stats
func hit():
	charHealth -= 1

func killed():
	enemiesKilled += 1

# change char pos
func changeCharPos(x, y):
	charPosx = x
	charPosy = y

func changeHealth(new):
	charHealth = new


func reset():
	blackHoleActive = false
	starActive = false
	enemiesKilled = 0
	charHealth = 10 + Upgrades.health
	charMaxHealth = charHealth

func changeBlackHoleStatus(new):
	blackHoleActive = new
	
func changeStarStatus(new):
	starActive = new

func resetSnowShield():
	snowShieldHealth = 5 + Upgrades.amount
