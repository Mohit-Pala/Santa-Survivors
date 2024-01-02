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


func _on_health_pressed():
	pass # Replace with function body.


func _on_regen_pressed():
	pass # Replace with function body.


func _on_curse_pressed():
	pass # Replace with function body.


func _on_amount_pressed():
	pass # Replace with function body.


func _on_speed_pressed():
	pass # Replace with function body.


func _on_greed_pressed():
	pass # Replace with function body.


func _on_projectile_speed_pressed():
	pass # Replace with function body.


func _on_projectile_timeout_pressed():
	pass # Replace with function body.


func _on_limit_break_pressed():
	pass # Replace with function body.


func _on_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")


func _on_to_weapon_shop_pressed():
	pass # Replace with function body.
