extends Node

# main stats
var charHealth = 10
var enemiesKilled = 0

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