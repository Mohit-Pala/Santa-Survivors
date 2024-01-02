extends Node

var gold = 0

func reduceGold(amount):
	gold -= amount

func addGold(amount):
	gold += amount

func changeGold(amount):
	gold = amount
