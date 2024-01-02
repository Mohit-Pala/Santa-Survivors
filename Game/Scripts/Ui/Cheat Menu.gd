extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	updateGold()

func updateGold():
	$"Gold label".text = "Gold:\n" + str(Gold.gold)

func _on_hundred_pressed():
	Gold.addGold(100)
	updateGold()

func _on_five_hundred_pressed():
	Gold.addGold(500)
	updateGold()

func _on_thousand_pressed():
	Gold.addGold(1000)
	updateGold()

func _on_ten_thousand_pressed():
	Gold.addGold(10000)
	updateGold()

func _on_fifty_thousand_pressed():
	Gold.addGold(50000)
	updateGold()

func _on_hundred_thousand_pressed():
	Gold.addGold(100000)
	updateGold()

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")
