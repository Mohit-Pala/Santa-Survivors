extends Node2D

var regenTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	regenTimer = 10 * sin(4.5 / (Upgrades.regen + 3))
	$Health.max_value = Run.charMaxHealth
	
	# start timers on run start
	$Regen.start(regenTimer)
	
	# replace with variables
	$Enemy.start(1)
	$Candy.start(5)
	
	if(Shop.snowball):
		$Snowball.start(1)
	if(Shop.healingTree):
		$Tree.start(10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Health.value = Run.charHealth
	$Kills.text = "Kills: " + str(Run.enemiesKilled)


func _on_flee_pressed():
	Gold.changeGold(Gold.gold + Run.enemiesKilled * 500 + (Run.enemiesKilled * 500 * 0.026 * 1.2**Upgrades.greed))
	Run.reset()
	get_tree().change_scene_to_file("res://Game/Scenes/Ui/Main Menu.tscn")


func _on_candy_timeout():
	for i in (Upgrades.amount + 1):
		var candy = load("res://Game/Scenes/Weapons/candy.tscn").instantiate()
		candy.position = $Santa.position
		add_child(candy)
		print("Spawned candy")
		await get_tree().create_timer(0.01).timeout


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
		print("Spawned Enemy")


func _on_regen_timeout():
	if(Run.charHealth < Run.charMaxHealth):
		Run.charHealth += 1
		print("Gained 1 hp")


func _on_snowball_timeout():
	if(Shop.snowball):
		for i in (Upgrades.amount + 1):
			var snowball = load("res://Game/Scenes/Weapons/Snowball.tscn").instantiate()
			snowball.position = $Santa.position
			add_child(snowball)
			print("Spawned snowball")
	else:
		pass


func _on_tree_timeout():
	var tree = load("res://Game/Scenes/Weapons/Healing Tree.tscn").instantiate()
	tree.position = $Santa.position
	add_child(tree)
	print("Spawned tree")
