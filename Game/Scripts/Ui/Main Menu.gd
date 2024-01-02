extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Gold label".text = "Gold:\n" + str(Gold.gold)
