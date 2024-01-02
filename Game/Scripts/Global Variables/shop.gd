extends Node

# items
var snowball = false
var presents = false
var star = false
var snowShield = false
var healingTree = false

# change items
func unlockSnowball():
	snowball = true

func unlockPresents():
	presents = true

func unlockStar():
	star = true

func unlockSnowShield():
	snowShield = true

func unlockHealingTree():
	healingTree = true
	
func changeSnowball(val):
	snowball = val

func changePresents(val):
	presents = val

func changeStar(val):
	star = val

func changeSnowShield(val):
	snowShield = val

func changeHealingTree(val):
	healingTree = val
