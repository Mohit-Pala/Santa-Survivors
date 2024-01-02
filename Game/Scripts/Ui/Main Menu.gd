extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Gold label".text = "Gold:\n" + str(Gold.gold)

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Save Game.tscn")

func _on_cheat_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Cheat Menu.tscn")

func _on_help_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Help Menu.tscn")

func _on_reset_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Reset Save File.tscn")


func _on_upgrade_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Upgrades.tscn")
