extends Control

var timeRemain
const saveCountdown = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	loadGame()
	$"Load Bar".max_value = saveCountdown
	$"Load Timer".start(saveCountdown)

func _physics_process(delta):
	$"Load Bar".set_value($"Load Timer".get_time_left())
	pass

func loadGame():
	pass

func _on_load_timer_timeout():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")
