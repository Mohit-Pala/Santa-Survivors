extends Node

var upgrades = 0
var limitBreak = false

# upgrades
var health = 0
var regen = 0
var curse = 0
var amount = 0
var speed = 0
var greed = 28
var projectileTimeout = 0
var projectileSpeed = 0

# change meta
func changeUpgrades(num):
	upgrades = num

func changelimitBreak(boo):
	limitBreak= boo

# change upgrades
func changeHealth(num):
	health = num

func changeRegen(num):
	regen = num

func changeCurse(num):
	curse = num

func changeAmount(num):
	amount = num

func changeSpeed(num):
	speed = num

func changeGreed(num):
	greed = num

func changeProjectileSpeed(num):
	projectileSpeed = num

func changeProjectileTimeout(num):
	projectileTimeout = num
