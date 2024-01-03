extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Health.max_value = Run.charHealth
	$Enemy.start(1)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Health.value = Run.charHealth


func _on_flee_pressed():
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")


func _on_candy_timeout():
	pass


func _on_enemy_timeout():
	var screenSize = get_window().size
	
	for i in (Upgrades.curse + 1):
		var enemySpawn = randi_range(0,1)
		var enemy

		if (enemySpawn == 0):
			enemy = load("res://Game/Scenes/Enemies/Snowman.tscn").instantiate()
		else:
			enemy = load("res://Game/Scenes/Enemies/Cookie.tscn").instantiate()
			
		enemy.position.x = randi_range(0 , screenSize.x)
		enemy.position.y = randi_range(0 ,screenSize.y)
		add_child(enemy)
