extends Control

var currGold
# Called when the node enters the scene tree for the first time.
func _ready():
	updateGold()

func updateGold():
	currGold = Gold.gold
	$"Gold label".text = "Gold\n" + str(currGold)


func _on_snowball_pressed():
	pass # Replace with function body.


func _on_presents_pressed():
	pass # Replace with function body.


func _on_star_pressed():
	pass # Replace with function body.


func _on_snow_shield_pressed():
	pass # Replace with function body.


func _on_healing_tree_pressed():
	pass # Replace with function body.


func _on_back_to_main_menu_pressed():
	pass # Replace with function body.


func _on_to_upgrade_menu_pressed():
	pass # Replace with function body.
